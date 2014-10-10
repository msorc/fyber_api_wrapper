require "fyber_api_wrapper/version"
require "fyber_api_wrapper/utils/request_signing"
require "fyber_api_wrapper/utils/signature_verification"
require "fyber_api_wrapper/request/base_request"
require "fyber_api_wrapper/request/offer"
require "fyber_api_wrapper/response/http_response"
require "fyber_api_wrapper/response/offer"
require "fyber_api_wrapper/response/collection"

module FyberApiWrapper
  
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(self.configuration)
  end

  def self.reset_configuration!
    self.configuration = Configuration.new
  end

  def self.get_offers(params)
    Request::Offer.new(params).get
  end

  class Configuration
    attr_accessor :format, :appid, :device_id, :ip, :offer_types, :api_key

    def offers_url
      "http://api.sponsorpay.com/feed/v1/offers.#{format}"
    end

    def user_agent
      "Fyber API Wrapper Gem"
    end
  end

  class BadRequestError < Exception
  end

  class NotAuthorizedError < Exception
  end
  
  class HTTPError < Exception
  end

  class SignatureVerificationError < Exception
  end


end