require 'spec_helper'

describe FyberApiWrapper::Utils::SignatureVerification do
  let(:test_class) {
    Class.new do
      include FyberApiWrapper::Utils::SignatureVerification
      
      attr_reader :signature_header_value

      def initialize(signature)
        @signature_header_value = signature
      end

      def response_body
        <<-STR
          {"title"=>"Connect - Social Map & Address Book",
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
      "store_id"=>"688695759"}        
        STR
      end

    end
  }
  let(:obj_with_invalid_signature) { test_class.new("stack overflow is down")}
  let(:obj_with_missing_signature) { test_class.new(nil)}
  subject { test_class.new("ba8e48499f19bc1e60f5993d32db8ffc19159d83") }

  describe "calculate_response_signature" do
    it "produces a hash of response_body concatenated with the API key" do
      concatenated = subject.response_body.dup << FyberApiWrapper.configuration.api_key
      expected_signature = Digest::SHA1.hexdigest(concatenated)
      expect(subject.calculate_response_signature).to eq(expected_signature)
    end
  end
  describe "#verify_response_signature!" do
    it "raises a SignatureVerificationError exception if signature produced locally differs from the one sent by the server" do
      expect { obj_with_invalid_signature.verify_response_signature! }.to raise_error(FyberApiWrapper::SignatureVerificationError)
    end
    it "does not raise anything if signatures match" do
      expect { subject.verify_response_signature! }.to_not raise_error
    end
    it "issues a warning if the server signature is missing or empty" do
      expect { obj_with_missing_signature.verify_response_signature! }.to output("WARNING: Missing server signature header. Be careful with the response data, they might have been tampered with.\n").to_stderr
    end
  end

end