$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Media do
  before do
    @note_id = "123"
    @media_id = "123abc"
    @media_url = "https://fooman:123123123@api.catch.com/v2/media"
    @client = catch_test_client
  end

  describe "#add_media(id, FILE)" do
    before do
    end

    it "posts a file to an existing note" do
      stub_put("#{@media_url}/#{@note_id}", "media.json")
      media = @client.add_media(@note_id, "test/fixtures/media.jpg")
      media.id.must_equal('123abc')
    end
  end

  describe "#media" do
    it "retrieves a media file" do
      stub_get("#{@media_url}/#{@note_id}/#{@media_id}", "media.jpg")
      media_file = @client.media(@note_id, @media_id)
puts media_file.size
    end
  end

  describe "#delete_media(note_id, media_id)" do
    before do
      stub_delete("https://fooman:123123123@api.catch.com/v2/media/#{@note_id}/#{@media_id}", "note_delete.json")
    end

    it "deletes a specified media file from a note" do
      media = @client.delete_media(@note_id, @media_id)
      media.must_equal true
    end
  end
end
