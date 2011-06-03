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

    it "retrieves values of a place" do
      @place.id.must_equal @id
      @place.name.must_equal "Somewhere"
    end
  end

  describe "#add_place(latitude, longitude, options={})" do
    before do
      stub_put("https://fooman:123123123@api.catch.com/v2/places","add_place.json")
    end

    it "adds a new place" do
      place = @client.add_place(90, 90)
      place.id.must_equal "abc123"
      place.name.must_equal "Somewhere"
    end
  end

  describe "#modify_place(id, options={})" do
    before do
      @id = 'abc123'
      stub_post("https://fooman:123123123@api.catch.com/v2/places/#{@id}", "modified_place.json")
    end

    it "returns the updated place" do
      place = @client.modify_place(@id, {:name => "Lorem ipsum"})
      place.id.must_equal @id
      place.name.must_equal "Lorem ipsum"
    end
  end

  describe "#delete_place(id)" do
    before do
      @id = 'abc123'
      stub_delete("https://fooman:123123123@api.catch.com/v2/places/#{@id}", "place_delete.json")
    end

    it "deletes a specified place" do
      place = @client.delete_place(@id)
      place.must_equal true
    end
  end
end
