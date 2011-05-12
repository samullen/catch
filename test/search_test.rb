$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Search do
  before do
    @client = catch_test_client
  end

  describe "#search" do
    before do
      @notes_url = "https://fooman:123123123@api.catch.com/v2/search"
#       stub_get(@notes_url, "notes.json")
    end

    it "passes query and search parameters, and returns an array of notes" do
      params = {:q => "Lorem%20ipsum"}
      stub_get(build_url(@notes_url, params), "search.json", params)
      notes = @client.search("Lorem ipsum")
      notes.must_be_instance_of Array
    end
  end
end

