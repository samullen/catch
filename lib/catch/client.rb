module Catch
  class Client
    include Note

    attr_reader :api_url, :username

    def initialize(options={})
      @api_url  = "https://api.catch.com/v1"
      @username = options[:username] || Catch.username
      password  = options[:password] || Catch.password
      connection.basic_auth(@username, password)
    end

    def connection
      @connection ||= Faraday.new(:url => @api_url, :headers => default_headers) do |builder|
        builder.adapter Faraday.default_adapter
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
      end
    end

  private

    def default_headers
      headers = { :accept =>  'application/json', :user_agent => 'Ruby gem' }
    end
  end
end
