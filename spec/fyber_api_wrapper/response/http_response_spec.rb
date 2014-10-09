require 'spec_helper'

describe FyberApiWrapper::Response::HttpResponse do 
  let(:response_class) { FyberApiWrapper::Response::HttpResponse } #too much typing
  describe "#unauthorized?" do
    it "returns true if the request response is an instance of Net::HTTPUnauthorized" do
      response = response_class.new(Net::HTTPUnauthorized.new("a", "b", "c"))
      expect(response).to be_unauthorized
    end
    it "returns false if the request response is not an instance of Net::HTTPUnauthorized" do
      response = response_class.new(Net::HTTPBadGateway.new("a", "b", "c"))
      expect(response).to_not be_unauthorized
    end
  end

  describe "#bad_request?" do
    it "returns true if the request response is an instance of Net::HTTPBadRequest" do
      response = response_class.new(Net::HTTPBadRequest.new("a", "b", "c"))
      expect(response).to be_bad_request
    end
    it "returns false if the request response is not an instance of Net::HTTPBadRequest" do
      response = response_class.new(Net::HTTPNotFound.new("a", "b", "c"))
      expect(response).to_not be_bad_request
    end
  end

  describe "#http_error?" do
    it "returns true if the request response is an instance of Net::HTTPNotFound" do
      response = response_class.new(Net::HTTPNotFound.new("a", "b", "c"))
      expect(response).to be_http_error
    end
    it "returns true if the request response is an instance of Net::HTTPFatalError" do
      response = response_class.new(Net::HTTPFatalError.new("a", "b"))
      expect(response).to be_http_error
    end
    it "returns true if the request response is an instance of Net::HTTPBadGateway" do
      response = response_class.new(Net::HTTPBadGateway.new("a", "b", "c"))
      expect(response).to be_http_error
    end

    it "returns false if request response is an instance of Net::HTTPUnauthorized as we don't consider it to be a http protocol level error" do
      response = response_class.new(Net::HTTPUnauthorized.new("a", "b", "c"))
      expect(response).to_not be_http_error
    end
  end

  describe "#failure?" do
    it "returns true if an HTTP level error occured performing the request" do
      response = response_class.new(Net::HTTPNotFound.new("a", "b", "c"))
      expect(response).to be_failure
    end
    it "returns true if the request resulted in 401 Unauthorized" do
      response = response_class.new(Net::HTTPUnauthorized.new("a", "b", "c"))
      expect(response).to be_failure
    end
    it "returns true if the request resulted in 400 Bad Request" do
      response = response_class.new(Net::HTTPBadRequest.new("a", "b", "c"))
      expect(response).to be_failure
    end
    it "returns false if the request returned 200 OK" do
      response = response_class.new(Net::HTTPOK.new("a", "b", "c"))
      expect(response).to_not be_failure
    end
  end

  describe "#success?" do
    it "returns true if the request is a HTTP OK" do
      response = response_class.new(Net::HTTPOK.new("a", "b", "c"))
      expect(response).to be_success
    end
    it "returns false if the request is not a HTTP OK" do
      response = response_class.new(Net::HTTPUnauthorized.new("a", "b", "c"))
      expect(response).not_to be_success
    end
  end

end