require 'spec_helper'
require 'digest/sha1'
require 'cgi'

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

  describe "#hash_to_query" do
    it "converts the hash into a query string, turning key-value pairs into key=value separated with ampersands" do
      hsh = {
        "sample" => "string",
        :another => :param,
        1 => 2      
      }
      expect(test_instance.hash_to_query(hsh)).to eq("sample=string&another=param&1=2")
    end
    it "translates nil values correctly" do
      hsh = { "sample" => "string", "empty" => nil}
      expect(test_instance.hash_to_query(hsh)).to eq("sample=string&empty=")
    end
    it "does not encode key/values by default" do
      hsh = { "the key" => "and value", "blah';" => '%whatever%'}
      expect(test_instance.hash_to_query(hsh)).to eq("the key=and value&blah';=%whatever%")
    end
    it "encodes keys and values properly if asked to do so" do
      hsh = { "the key" => "and value", "blah';" => '%whatever%'}
      expect(test_instance.hash_to_query(hsh, true)).to eq("the%20key=and%20value&blah';=%25whatever%25")
    end
  end

  describe "#append_api_key" do
    it "appends an ampersand the API key to the string given" do
      expect(test_instance.append_api_key("some-test-string")).to eq("some-test-string&#{::FyberApiWrapper.configuration.api_key}")
    end
  end

  describe "#query_string_digest" do
    it "returns the SHA1 digest of the string given" do
      str = 'some-test-string&another-test-string'
      expect(test_instance.query_string_digest(str)).to eq(Digest::SHA1.hexdigest(str))
    end
  end

  describe "#signed_query_string" do
    let(:correct_params) {
      {
        "answer_to_the_life_universe_and_everything"=>["42"], 
        "appid"=>["123112"],
        "ip"=>["212.12.2.1"],
        "ps_time"=>["12312311"],
        "uid"=>["sample-uid"],
        "hashkey"=>["09d2988f4df1f06f090a25e708173896e303df75"]
      }
    }
    it "produces a query string with a hashkey" do
      query_str = test_instance.signed_query_string
      params = CGI::parse(URI.parse("?#{query_str}").query)
      params.each_pair {|k, v| expect(params[k]). to eq(correct_params[k])}
    end
    it "produces the correct hash key" do
      query_str = test_instance.signed_query_string
      params = CGI::parse(URI.parse("?#{query_str}").query)
      #repeat the hash generation manually here
      tmp = {}
      correct_params.each_pair {|k,v| tmp[k] = v[0]}
      tmp.delete("hashkey")
      query_str_with_api_key = test_instance.append_api_key(test_instance.hash_to_query(tmp))
      expect(Digest::SHA1.hexdigest(query_str_with_api_key)).to eq(correct_params["hashkey"][0])
    end
  end

end