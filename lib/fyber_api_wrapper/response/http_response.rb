require 'net/http'
require 'json'
require 'zlib'

module FyberApiWrapper
  module Response
    class HttpResponse
      def initialize(request_response)
        @request_response = request_response
      end

      def raise_error_if_unsuccessful!
        unless success?
          raise_if_http_error! 
          raise_if_unauthorized! 
          raise_if_bad_request!
        end
      end

      def failure?
        http_error? || unauthorized? || bad_request?
      end

      def success?
        !failure?
      end

      def unauthorized?
        @request_response.is_a?(Net::HTTPUnauthorized)
      end

      def bad_request?
        @request_response.is_a?(Net::HTTPBadRequest)
      end

      def http_error?
        !unauthorized? && !bad_request? && !@request_response.is_a?(Net::HTTPOK)
      end

      def response_body
        @response_body ||= fetch_response_body
      end

      def response_body_as_json
        @response_body_as_json ||= JSON.parse(response_body)
      end

      private

      include Utils::SignatureVerification

      def signature_header_value
        @request_response['X-Sponsorpay-Response-Signature']
      end

      def raise_if_http_error!
        raise FyberApiWrapper::HTTPError, "Could not perform the request. Got #{@request_response.class} " if http_error?
      end

      def raise_if_unauthorized!
        raise FyberApiWrapper::NotAuthorizedError, error_message if unauthorized?
      end

      def raise_if_bad_request!
        raise FyberApiWrapper::RequiredParameterMissingError, error_message if bad_request?
      end

      def error_message
        "code : " << response_body_as_json["code"] << ", message: " << response_body_as_json["message"]
      end

      def fetch_response_body
        response_body = nil
        # try Zlib first
        begin
          inflated_data = Zlib::GzipReader.new(StringIO.new(@request_response.body))
          response_body = inflated_data.read
        rescue Zlib::GzipFile::Error
        # ok just plain text
          response_body = @request_response.body
        end
        response_body    
      end

    end

  end
end