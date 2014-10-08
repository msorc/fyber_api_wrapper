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
    let(:offers) { wrapper.get }
    it "performs a get request and returns a collection of Offers" do
      expect(offers).to be_a(FyberApiWrapper::Response::Collection)
    end
    it "returns a collection that contains Response::Offers" do
      offers.each {|o| expect(o).to be_a(FyberApiWrapper::Response::Offer) }
    end
  end
end