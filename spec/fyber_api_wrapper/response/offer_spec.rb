# encoding: UTF-8
require 'spec_helper'

describe FyberApiWrapper::Response::Offer do
  let(:offer_hash) {
    {
      "title"=>"Connect - Social Map & Address Book",
      "offer_id"=>275789,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/379955e57bd687f4/mobile/DE/157/offers/275789",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>30215,
      "time_to_payout"=>{"amount"=>3300, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn1.sponsorpay.com/app_icons/20264/small_mobile_icon.png",
        "hires"=>
         "http://cdn1.sponsorpay.com/app_icons/20264/big_mobile_icon.png"},
      "store_id"=>"688695759"
    }
  }
  subject { FyberApiWrapper::Response::Offer.new(offer_hash)}
  ["title", "offer_id", "teaser", "required_actions", "link", "payout", "store_id"].each do |attribute|
    describe "##{attribute}" do
      it "should have the correct value" do
        expect(subject.send(attribute.to_sym)).to eq(offer_hash[attribute])
      end
    end
  end

  describe "#offer_types" do
    it "should return an array of offer types" do
      expect(subject.offer_types).to be_a(Array)
    end
    it "should have the correct count" do
      expect(subject.offer_types.count).to eq(2)
    end
    it "should return an array of OfferType items" do
      subject.offer_types.each { |ot| expect(ot).to be_a(FyberApiWrapper::Response::OfferType)}
    end
    it "should populate each offer type correctly" do
      ots = subject.offer_types
      expect(ots[0].offer_type_id).to eq(101)
      expect(ots[0].readable).to eq("Download")
      expect(ots[1].offer_type_id).to eq(112)
      expect(ots[1].readable).to eq("Free")
    end
  end

  describe "#time_to_payout" do
    it "returns a TimeToPayout" do
      expect(subject.time_to_payout).to be_a(FyberApiWrapper::Response::TimeToPayout)
    end
    it "populates the TimeToPayout correctly" do
      expect(subject.time_to_payout.amount).to eq(3300)
      expect(subject.time_to_payout.readable).to eq("1 hour")
    end
  end

  describe "#thumbnail" do
    it "returns a Thumbnail" do
      expect(subject.thumbnail).to be_a(FyberApiWrapper::Response::Thumbnail)
    end
    it "populates the Thumbnail correctly" do
      expect(subject.thumbnail.lowres).to eq("http://cdn1.sponsorpay.com/app_icons/20264/small_mobile_icon.png")
      expect(subject.thumbnail.hires).to eq("http://cdn1.sponsorpay.com/app_icons/20264/big_mobile_icon.png")
    end
  end

end