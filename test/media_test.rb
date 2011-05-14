$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Media do
  before do
    @client = catch_test_client
  end

  describe "#add_media(id, FILE)" do
    before do
      @notes_url = "https://fooman:123123123@api.catch.com/v2/media"
    end

    it "posts a file to an existing note" do
#       params = {:q => "Lorem%20ipsum"}

      stub_put("#{@notes_url}/#{@id}"build_url(@notes_url, params), "media.json", params)
      notes = @client.media('12345678', "files/...jpg")
      notes.must_be_instance_of Array
    end
  end

#   describe "#media" do
# 
#     it "retrieves a list of notes as an array" do
#       @notes.must_be_instance_of Array
#     end
# 
#     it "retrieves values from a note within the retrieved array" do
#       @notes.first.id.must_equal "12345678"
#     end
# 
#     it "takes a hash as a parameter" do
#       params = {:limit => 2}
#       stub_get(build_url(@notes_url, params), "notes.json", params)
#       @client.notes(params).first.id.must_equal "12345678"
#     end
#   end
end
