$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Comment do
  before do
    @client = catch_test_client
  end

  describe "#comments" do
    before do
      @comments_url = "https://fooman:123123123@api.catch.com/v2/comments/123"
      stub_get(@comments_url, "comments.json")
      @comments = @client.comments(123)
    end

    it "retrieves a list of comments for a specified note as an array" do
      @comments.must_be_instance_of Array
    end

    it "retrieves values from a comment within the retrieved array" do
      @comments.first.text.must_equal "Lorem ipsum dolor1"
    end

    it "takes a hash as a parameter" do
      params = {:limit => 2}
      stub_get(build_url(@comments_url, params), "comments.json", params)
      @client.comments(123, params).first.id.must_equal "1234"
    end
  end

# Retrieving a single comment doesn't work against Catch API
#   describe "#comment(id)" do
#     before do
#       @note_id = '123'
#       @comment_id = '12345678'
#       params = {:comment => @comment_id}
#       stub_get(build_url(@comments_url, params), "comment.json", params)
#       @comment = @client.comment(@note_id, @comment_id)
#     end
# 
#     it "retrieves values a note" do
#       @comment.id.must_equal @comment_id
#       @comment.text.must_equal "Lorem ipsum dolor1"
#     end
#   end

  describe "#add_note(options={})" do
    before do
      stub_post("https://fooman:123123123@api.catch.com/v2/notes", "note.json")
    end

    it "adds a new note" do
      note = @client.add_note({:text => "Lorem ipsum dolor"})
      note.id.must_equal "12345678"
      note.text.must_equal "Lorem ipsum dolor"
    end
  end

#   describe "#modify_note(id, options={})" do
#     before do
#       @id = '12345678'
#       stub_post("https://fooman:123123123@api.catch.com/v2/notes/#{@id}", "modified_note.json")
#     end
# 
#     it "returns the updated note" do
#       note = @client.modify_note(@id, {:text => "Foo bar baz"})
#       note.id.must_equal @id
#       note.text.must_equal "Foo bar baz"
#     end
#   end
# 
#   describe "#delete_note(id)" do
#     before do
#       @id = '123123'
#       stub_delete("https://fooman:123123123@api.catch.com/v2/notes/#{@id}", "note_delete.json")
#     end
# 
#     it "deletes a specified note" do
#       note = @client.delete_note(@id)
#       note.must_equal true
#     end
#   end
end
