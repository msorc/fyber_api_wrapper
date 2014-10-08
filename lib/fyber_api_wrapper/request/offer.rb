require 'uri'
require 'net/http'
require 'json'

module FyberApiWrapper
  module Request
    class Offer
      attr_reader :params

      def initialize(params = {})
        @params = params.merge(offer_params)
      end

      def get
        body = perform_request.body
        JSON.parse(body)
      end


      private

      def perform_request
        offer_url = "#{FyberApiWrapper.configuration.offers_url}?#{signed_query_string}"
        url_parts = URI.parse(offer_url)
        request = Net::HTTP::Get.new("#{url_parts.path}?#{url_parts.query}")
        request_headers.each { |h, v| request.add_field(h, v) }
        Net::HTTP.new(url_parts.host).start do |http|
          http.request(request)
        end
      end

      include RequestSigning

      def request_headers
        {
          "Accept" => "application/#{FyberApiWrapper.configuration.format}",
          "User-Agent"      => FyberApiWrapper.configuration.user_agent
        }
      end

      def offer_params
        {
          appid:       FyberApiWrapper.configuration.appid,
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