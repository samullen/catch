$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Place do
  before do
    @client = catch_test_client
  end

#   describe "#places" do
#     before do
#       @places_url = "https://fooman:123123123@api.catch.com/v2/places"
#       stub_get(@places_url, "places.json")
#       @places = @client.places
#     end
# 
#     it "retrieves a list of places as an array" do
#       @places.must_be_instance_of Array
#     end
# 
#     it "retrieves values from a place within the retrieved array" do
#       @places.first.id.must_equal "12345678"
#     end
# 
#     it "takes a hash as a parameter" do
#       params = {:limit => 2}
#       stub_get(build_url(@notes_url, params), "notes.json", params)
#       @client.notes(params).first.id.must_equal "12345678"
#     end
#   end

  describe "#add_place(options={})" do
    before do
      stub_post("https://fooman:123123123@api.catch.com/v2/places","place.json")
    end

    it "adds a new note" do
      note = @client.add_note({:latitude => 90, :longitude => 90})
#       note.id.must_equal "12345678"
#       note.text.must_equal "Lorem ipsum dolor"
    end
  end

  end
end
