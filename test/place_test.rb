$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Place do
  before do
    @client = catch_test_client
  end

  describe "#places" do
    before do
      @places_url = "https://fooman:123123123@api.catch.com/v2/places"
      stub_get(@places_url, "places.json")
      @places = @client.places
    end

    it "retrieves a list of places as an array" do
      @places.must_be_instance_of Array
    end

    it "retrieves values from a place within the retrieved array" do
      @places.first.id.must_equal "abc123"
    end
  end

  describe "#place(id)" do
    before do
      @id = 'abc123'
      stub_get("https://fooman:123123123@api.catch.com/v2/places/#{@id}", "place.json")
      @place = @client.place(@id)
    end

    it "retrieves values a note" do
      @place.id.must_equal @id
      @place.name.must_equal "Somewhere"
    end
  end

  describe "#add_place(latitude, longitude, options={})" do
    before do
      stub_put("https://fooman:123123123@api.catch.com/v2/places","add_place.json")
    end

    it "adds a new place" do
      note = @client.add_place(90, 90)
      note.id.must_equal "abc123"
      note.name.must_equal "Somewhere"
    end
  end
end
