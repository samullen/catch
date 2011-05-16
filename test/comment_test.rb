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

  describe "#comment(id)" do
    before do
      @note_id = '123'
      @comment_id = '12345678'
      @comment_url = "https://fooman:123123123@api.catch.com/v2/comment/123"
      params = {:comment => @comment_id}
      stub_get(build_url(@comment_url, params), "comment.json", params)
      @comment = @client.comment(@note_id, @comment_id)
    end

    it "retrieves values a note" do
      @comment.id.must_equal @comment_id
      @comment.text.must_equal "Lorem ipsum dolor"
    end
  end

  describe "#add_comment(options={})" do
    before do
      stub_post("https://fooman:123123123@api.catch.com/v2/comments/123", "comment.json")
    end

    it "adds a new comment to a note" do
      comment = @client.add_comment(123, {:text => "Lorem ipsum dolor"})
      comment.id.must_equal "12345678"
      comment.text.must_equal "Lorem ipsum dolor"
    end
  end

  describe "#modify_comment(note_id, comment_id, options={})" do
    before do
      @note_id = '123'
      @comment_id = '12345678'
      @comments_url = "https://fooman:123123123@api.catch.com/v2/comments/123"
    end

    it "returns the updated comment" do
      params = {:comment => @comment_id, :text => "Foo%20bar%20baz"}
      stub_post(build_url(@comments_url, params), "modified_comment.json", params)
      comment = @client.modify_comment(@note_id, @comment_id, {:text => "Foo bar baz"})
      comment.id.must_equal @comment_id
      comment.text.must_equal "Foo bar baz"
    end
  end

  describe "#delete_note(id)" do
    before do
      @note_id = '123'
      @comment_id = '12345678'
      stub_delete("https://fooman:123123123@api.catch.com/v2/comments/#{@note_id}?comment=#{@comment_id}", "comment_delete.json")
    end

    it "deletes a specified comment" do
      comment = @client.delete_comment(@note_id, @comment_id)
      comment.must_equal true
    end
  end
end
