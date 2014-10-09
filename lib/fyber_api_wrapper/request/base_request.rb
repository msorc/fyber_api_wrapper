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
        check_http_errors!
        fetch_response_body
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
        @response = Net::HTTP.new(url_parts.host).start do |http|
          http.request(@request)
        end        
      end

      def check_http_errors!
        case @response
          when Net::HTTPBadGateway
          when Net::HTTPClientError
          when Net::HTTPConflict
          when Net::HTTPFatalError
          when Net::HTTPForbidden
          when Net::HTTPGatewayTimeOut
          when Net::HTTPNotFound
            raise FyberApiWrapper::HTTPError, "Could not perform the request. Got #{@response.class} "                      
        end
      end

      def reset_request_vars!
        @request = nil
        @response = nil
        @response_body = nil        
      end

      def fetch_response_body
        @response_body = get_response_body
      end

      def process_response
        case @response
          when Net::HTTPUnauthorized
            raise FyberApiWrapper::NotAuthorizedError, error_message(@response_body)
          when Net::HTTPBadRequest
            raise FyberApiWrapper::RequiredParameterMissingError, error_message(@response_body)
        end
        # if we got here, we have some valid data.
        verify_response_signature!
        FyberApiWrapper::Response::Collection.new(JSON.parse(@response_body))
      end

      def get_response_body
        response_body = nil
        # try Zlib first
        begin
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
      include SignatureVerification

      def signature_header_value
        @response['X-Sponsorpay-Response-Signature']
      end

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