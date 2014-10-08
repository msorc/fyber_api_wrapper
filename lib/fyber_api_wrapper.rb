require "fyber_api_wrapper/version"
require "fyber_api_wrapper/request_signing"
require "fyber_api_wrapper/request"
require "fyber_api_wrapper/offer_wrapper"

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

  class Configuration
    attr_accessor :format, :appid, :device_id, :ip, :offer_types, :api_key

    def api_url
      "http://api.sponsorpay.com/feed/v1/offers"
    end
  end

end