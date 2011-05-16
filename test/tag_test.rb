$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Tag do
  before do
    @client = catch_test_client
  end

  describe "#tags" do
    before do
      @tags_url = "https://fooman:123123123@api.catch.com/v2/tags"
      stub_get(@tags_url, "tags.json")
      @tags = @client.tags
    end

    it "retrieves a users tag list" do
      @tags.must_be_instance_of Array
    end

    it "retrieves values from a tag within the retrieved array" do
      @tags.first.name.must_equal "RoR"
      @tags.first['count'].must_equal 2
    end
  end
end
