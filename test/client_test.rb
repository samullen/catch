$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Client do
  before do
    @client = catch_test_client
  end

  describe "accessing the API" do
    it "sets the default url" do
      client = Catch::Client.new
      client.api_url.must_equal 'https://api.catch.com/v2'
    end
  end

  describe "Configuring some defaults" do
    it "sets username and and api_url" do
      Catch.configure do |config|
        config.username = "barman"
        config.password = "321321321"
      end

      client = Catch::Client.new
      client.username.must_equal "barman"
      client.api_url.must_equal "https://api.catch.com/v2"
    end
  end
end
