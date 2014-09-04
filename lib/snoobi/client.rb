require 'oauth'
require 'json'

module Snoobi
  class SnoobiApiError < StandardError; end

  class Client
    API_URL = "https://api.snoobi.com/"

    attr_accessor :consumer_key, :consumer_secret, :token, :token_secret

    def initialize(options={})
      options.each do |option,value|
        self.send("#{option}=", value) if self.respond_to?("#{option}=")
      end
    end

    def get(path)
      response = access_token.get(normalize_path(path))
      check_response(response)
    end

    def post(path, payload)
      response = access_token.post(normalize_path(path), payload.to_json, {'Content-Type' => 'application/json'})
      check_response(response)
    end

    def put(path, payload)
      response = access_token.put(normalize_path(path), payload.to_json, {'Content-Type' => 'application/json'})
      check_response(response)
    end

    def delete(path)
      response = access_token.delete(normalize_path(path))
      check_response(response)
    end

    private

    def normalize_path(path)
      path.match(/^\//).nil? ? "/#{path}" : path
    end

    def check_response(response)
      raise Snoobi::SnoobiApiError.new(response.body) if response.code.to_i != 200
      JSON.parse(response.body)
    end

    def access_token
      return @access_token if @access_token

      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {site: API_URL})
      @access_token = OAuth::AccessToken.new(consumer, token, token_secret)
    end
  end
end
