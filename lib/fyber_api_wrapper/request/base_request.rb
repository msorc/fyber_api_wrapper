require 'uri'
require 'net/http'

module FyberApiWrapper
  module Request
    class BaseRequest
      attr_reader :params

      def initialize(params = {})
        @params = params.merge(mandatory_request_params)
      end

      def get
        @response = Response::HttpResponse.new(make_request)
        @response.raise_error_if_unsuccessful!
        @response.verify_response_signature!
        @response_body = @response.response_body_as_json
        process_response
      end

      protected

      attr_reader :request, :response, :response_body

      def request_url
        raise "Implement #request_url in your subclass and provide the URL to send request to"
      end      

      def request_headers
        {
          "Accept"          => "application/#{FyberApiWrapper.configuration.format}",
          "User-Agent"      => FyberApiWrapper.configuration.user_agent,
          "Accept-Encoding" => "gzip, deflate"
        }
      end

      def make_request
        reset_request_vars!
        url_parts = URI.parse(request_url)
        @request = Net::HTTP::Get.new("#{url_parts.path}?#{url_parts.query}")
        request_headers.each { |h, v| @request.add_field(h, v) }
        Net::HTTP.new(url_parts.host).start do |http|
          http.request(@request)
        end        
      end

      def reset_request_vars!
        @request = nil
        @response = nil
        @response_body = nil        
      end

      def process_response
        raise "Implement #process_response in your subclass!"
      end

      private

      include Utils::RequestSigning

      def mandatory_request_params
        {
          appid:        FyberApiWrapper.configuration.appid,
          device_id:    FyberApiWrapper.configuration.device_id,
          ip:           FyberApiWrapper.configuration.ip,
          offer_types:  FyberApiWrapper.configuration.offer_types,
          api_key:      FyberApiWrapper.configuration.api_key,
          locale:      FyberApiWrapper.configuration.locale,
          timestamp:    Time.now.to_i
        }        
      end

    end
  end
end
