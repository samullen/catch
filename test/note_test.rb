$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Note do
  before do
    @client = catch_test_client
  end

  describe "#notes" do
    it "retrieves a list of notes" do
puts 'got here'
      stub_get("https://fooman:123123123@api.catch.com/v1/notes", "notes.json")
      notes = @client.notes
      notes.first.name.should == ''
    end
  end
end
