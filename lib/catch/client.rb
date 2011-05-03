module Catch
  class Client

    def initialize(options={})
      @api_url = "https://api.catch.com/v1"
      username = options[:username]
      password = options[:password]
    end

    def connection
      @connection ||= Faraday.new(:url => @api_url, :headers => default_headers) do |builder|
#         builder.use Faraday::Request::JSON
        builder.adapter Faraday.default_adapter
      end
    end

  private

    def default_headers
      headers = { :accept =>  'application/json', :user_agent => 'Ruby gem' }
    end
  end
end
