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
  
  describe "#get" do
    it "performs a get request and returns a collection of Offers" do
      offers = wrapper.get
      require 'pp'
      pp offers
      expect(offers).to respond_to(:[])
      expect(offers).to respond_to(:each)
    end
  end
end