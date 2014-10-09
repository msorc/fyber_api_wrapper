require 'uri'
require 'net/http'
require 'json'
require 'zlib'

module FyberApiWrapper
  module Request
    class BaseRequest
      attr_reader :params

      def initialize(params = {})
        @params = params.merge(mandatory_request_params)
      end

      def get
        make_request
        process_response        
      end

      protected

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
        @request = nil
        @response = nil
        url_parts = URI.parse(request_url)
        @request = Net::HTTP::Get.new("#{url_parts.path}?#{url_parts.query}")
        request_headers.each { |h, v| @request.add_field(h, v) }
        @response = Net::HTTP.new(url_parts.host).start do |http|
          http.request(@request)
        end        
      end

      def process_response
        case @response
          when Net::HTTPUnauthorized
            json = get_response_body
            raise FyberApiWrapper::NotAuthorizedError, error_message(json)
          when Net::HTTPBadRequest
            json = get_response_body
            raise FyberApiWrapper::RequiredParameterMissingError, error_message(json)
          when Net::HTTPBadGateway
          when Net::HTTPClientError
          when Net::HTTPConflict
          when Net::HTTPFatalError
          when Net::HTTPForbidden
          when Net::HTTPGatewayTimeOut
          when Net::HTTPNotFound            
            raise FyberApiWrapper::HTTPError, "#{@response.class}"
        end
        FyberApiWrapper::Response::Collection.new(JSON.parse(get_response_body))
      end

      def get_response_body
        response_body = nil
        # try Zlib first
        begin
          require 'pry' ; binding.pry
          inflated_data = Zlib::GzipReader.new(StringIO.new(@response.body))
          response_body = inflated_data.read
        rescue Zlib::GzipFile::Error
        # ok just plain text
          response_body = @response.body
        end
        response_body    
      end

      def error_message(json)
        "code : #{json["code"]}, message: #{json["message"]}"
      end

      private

      include RequestSigning

      def mandatory_request_params
        {
          appid:        FyberApiWrapper.configuration.appid,
          device_id:    FyberApiWrapper.configuration.device_id,
          ip:           FyberApiWrapper.configuration.ip,
          offer_types:  FyberApiWrapper.configuration.offer_types,
          api_key:      FyberApiWrapper.configuration.api_key,
          timestamp:    Time.now.to_i
        }        
      end

    end
  end
end