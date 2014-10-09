require 'uri'
require 'net/http'
require 'json'

module FyberApiWrapper
  module Request
    class Offer < BaseRequest

      protected

      def request_url
        "#{FyberApiWrapper.configuration.offers_url}?#{signed_query_string}"
      end

      def process_response
        FyberApiWrapper::Response::Collection.new(@response.response_body_as_json)
      end

    end
  end
end