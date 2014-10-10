require 'spec_helper'

describe FyberApiWrapper::Request::Offer do
  let(:params) {
    {
      :uid => "luc",
      :pub0 => "campaign1",
      :page => "1",
    }
  }
  let(:wrapper) { FyberApiWrapper::Request::Offer.new(params)}


  describe "#get", :vcr do
    let(:offers) { wrapper.get }
    context "when everything goes well" do
      it "performs a get request and returns a collection of Offers" do
        expect(offers).to be_a(FyberApiWrapper::Response::Collection)
      end
      it "returns a collection that contains Response::Offers" do
        offers.each {|o| expect(o).to be_a(FyberApiWrapper::Response::Offer) }
      end
    end
    context "when the api_key is missing or invalid" do
      before(:each) do
        @api_key = FyberApiWrapper.configuration.api_key
        FyberApiWrapper.configure do |config|
          config.api_key = "blablala"
        end
      end
      after(:each) do
        FyberApiWrapper.configure do |config|
          config.api_key = @api_key
        end
      end
      it "raises a not authorized exception in case the API key is missing" do
        wrapper = FyberApiWrapper::Request::Offer.new(params)
        expect { wrapper.get }.to raise_error(FyberApiWrapper::NotAuthorizedError)
      end
    end
    context "when a required parameter is missing" do
      before(:each) do
        @appid = FyberApiWrapper.configuration.appid
        FyberApiWrapper.configure do |config|
          config.appid = nil
        end
      end
      after(:each) do
        FyberApiWrapper.configure do |config|
          config.appid = @appid
        end
      end
      it "raises a required parameter missing error in case the API key is missing" do
        wrapper = FyberApiWrapper::Request::Offer.new(params)
        expect { wrapper.get }.to raise_error(FyberApiWrapper::BadRequestError)
      end
    end
  end

end