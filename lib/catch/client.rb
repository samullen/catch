module Catch
  class Client
    include Comment
    include Media
    include Note
    include Search
    include Tag
    include User

    attr_reader :api_url, :username

    def initialize(options={})
      @api_url  = "https://api.catch.com/v2"
      @username = options[:username] || Catch.username
      password  = options[:password] || Catch.password
      connection.basic_auth(@username, password)
      media_connection.basic_auth(@username, password)
    end

    def connection
      @connection ||= Faraday.new(:url => @api_url, :headers => default_headers) do |builder|
        builder.request :multipart
        builder.request :url_encoded
        builder.request :json
        builder.adapter Faraday.default_adapter
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
      end
    end

    def media_connection
      @media_connection ||= Faraday.new(:url => @api_url, :headers => default_headers) do |builder|
        builder.request :multipart
        builder.request :url_encoded
        builder.adapter Faraday.default_adapter
        builder.use Faraday::Response::Mashify
      end
    end
  private

    def default_headers
      headers = { 
        :accept =>  'application/json', 
        :user_agent => 'Ruby gem' 
      }
    end
  end
end
