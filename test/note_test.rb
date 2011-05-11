$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Note do
  before do
    @client = catch_test_client
  end

  describe "#notes" do
    before do
      @notes_url = "https://fooman:123123123@api.catch.com/v2/notes"
      stub_get(@notes_url, "notes.json")
      @notes = @client.notes
    end

    it "retrieves a list of notes as an array" do
      @notes.must_be_instance_of Array
    end

    it "retrieves values from a note within the retrieved array" do
      @notes.first.id.must_equal "12345678"
    end

    it "takes a hash as a parameter" do
      params = {:limit => 2}
      stub_get(build_url(@notes_url, params), "notes.json", params)
      @client.notes(params).first.id.must_equal "12345678"
    end
  end

  describe "#note(id)" do
    before do
      @id = '12345678'
      stub_get("https://fooman:123123123@api.catch.com/v2/notes/#{@id}", "note.json")
      @note = @client.note(@id)
    end

    it "retrieves values a note" do
      @note.id.must_equal @id
      @note.text.must_equal "Lorem ipsum dolor"
    end
  end

  describe "#create_note(options={})" do
    before do
      stub_post("https://fooman:123123123@api.catch.com/v2/notes", "note.json")
    end

    it "creates a new note" do
      note = @client.create_note({:text => "Lorem ipsum dolor"})
      note.id.must_equal "12345678"
      note.text.must_equal "Lorem ipsum dolor"
    end
  end

  describe "#delete_note(id)" do
    before do
      @id = '123123'
      stub_delete("https://fooman:123123123@api.catch.com/v2/notes/#{@id}", "note_delete.json")
    end

    it "deletes a specified note" do
      note = @client.delete_note(@id)
      note.must_equal true
    end
  end
end
