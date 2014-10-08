require 'spec_helper'

describe FyberApiWrapper::RequestSigning do
  let(:test_class) {
    Class.new do
      
      attr_reader :params

      def initialize(params)
        @params = params
      end

      include FyberApiWrapper::RequestSigning
      
    end
  }
  let(:params) {
    {
      uid: "sample-uid",
      ip: "212.12.2.1",
      appid: '123112',
      ps_time: '12312311',
      "answer_to_the_life_universe_and_everything" => 42
    }
  }
  let(:test_instance) { test_class.new(params) }
  describe "#ordered_params_for_signing" do
    it "returns a copy of the params hash ordered by key asc" do
      expect(test_instance.ordered_params_for_signing).to eq({
          "answer_to_the_life_universe_and_everything" => 42,
          appid: '123112',
          ip: "212.12.2.1",
          ps_time: '12312311',
          uid: "sample-uid",
        })
    end
    it "removes the hashkey if present in params" do
      test_instance = test_class.new({
        uid: "sample-uid",
        ip: "212.12.2.1",
        appid: '123112',
        ps_time: '12312311',
        hashkey: 'bam!',
        "hashkey" => "boom!",
        })
      expect(test_instance.ordered_params_for_signing).to eq({
        appid: '123112',
        ip: "212.12.2.1",
        ps_time: '12312311',
        uid: "sample-uid",
      })
    end

  end
end