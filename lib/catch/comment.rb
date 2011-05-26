module Catch
  module Comment

    # Retrieve a list of all comments for a note.
    #
    # @param [Integer] note_id Note ID
    def comments(note_id)
      connection.get do |req|
        req.url("comments/#{note_id}")
      end.body.notes
    end

    # Retrieves a single comment from the server.
    #
    # @param [Integer] note_id Note ID
    # @param [Integer] comment_id Comment ID
    def comment(note_id, comment_id)
      params = {:comment => comment_id}
      connection.get do |req|
        req.url("comment/#{note_id}")
        req.params.merge!(params)
      end.body.notes.first
    end

    # Adds a new comment to a note.
    #
    # @param [Integer] note_id Note ID
    # @option params [String] :source Source (application) which created the comment.
    # @option params [String] :text The text of the comment
    # @option params [DateTime] :created_at Date at which the comment was created.
    # @option params [DateTime] :modified_at Date of last modification
    # @option params [DateTime] :server_modified_at Providing the server_modified_at timestamp will ensure that the object being modified is not out of date.
    def add_comment(note_id, params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.post "comments/#{note_id}", payload
      response.body.notes.first
    end

    # Edits an existing comment.
    #
    # @param [Integer] note_id Note ID
    # @param [Integer] comment_id Comment ID
    # @option params [String] :source Source (application) which created the comment.
    # @option params [String] :text The text of the comment
    # @option params [DateTime] :created_at Date at which the comment was created.
    # @option params [DateTime] :modified_at Date of last modification
    # @option params [DateTime] :server_modified_at Providing the server_modified_at timestamp will ensure that the object being modified is not out of date.
    def modify_comment(note_id, comment_id, params={})
      payload = {:comment => comment_id }
      payload.merge! params

      response = connection.post do |req|
        req.url("comments/#{note_id}")
        req.params.merge!(payload)
      end.body.notes.first
    end

    # Remove a single comment from a note.
    #
    # @param [Integer] note_id Note ID
    # @param [Integer] comment_id Comment ID
    def delete_comment(note_id, comment_id)
      connection.delete("comments/#{note_id}?comment=#{comment_id}").body.status == 'ok'
    end
  end
end
