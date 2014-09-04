require_relative 'spec_helper'

describe Snoobi::Client do
  let(:client) {Snoobi::Client.new}
  let(:login) {client.login(SNOOBI_TEST_USERNAME, SNOOBI_TEST_PASSWORD)}

  describe :oauth_request do
    it "raises an error with invalid oauth tokens" do
      expect{client.get('health')}.to raise_error(
        Snoobi::SnoobiApiError)
    end
  end

  describe :normalize_path do
    it "adds a leading slash to the given path" do
      expect(client.send(:normalize_path, 'test')).to eq('/test')
      expect(client.send(:normalize_path, '/test')).to eq('/test')
    end
  end

  describe :check_response do
    it "returns the body" do
      response = double("response")
      expect(response).to receive(:code).and_return(200)
      expect(response).to receive(:body).and_return('{"foo": "bar"}')
      expect(client.send(:check_response, response)).to eq({"foo" => "bar"})
    end

    it "raises and exception with invalid response code" do
      response = double("response")
      expect(response).to receive(:code).and_return(300)
      expect(response).to receive(:body).and_return('test')
      expect{client.send(:check_response, response)}.to raise_error(Snoobi::SnoobiApiError, 'test')
    end
  end

  describe :access_token do
    it "returns an access_token" do
      expect(client.send(:access_token)).to be_a(OAuth::AccessToken)
    end
  end
end
