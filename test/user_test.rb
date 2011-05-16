$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::User do
  before do
    @client = catch_test_client
  end

  describe "#user" do
    before do
      stub_get("https://fooman:123123123@api.catch.com/v2/user", "user.json")
      @user = @client.user
    end

    it "retrieves the user record" do
      @user.account_level_desc.must_equal "Catch Free"
      @user.user_name.must_equal "API Documenter"
    end
  end
end
