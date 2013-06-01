module Catch
  module Note
    # Lists multiple notes for the current user.
    #
    # @option params [String] :sort default is created_dec
    # Specifies a note sort order. Valid sort orders are:
    # created_asc sort by note creation date in ascending order (most recent first)
    # create_dec sort by note creation date in descending order (most recent last)
    # modified_asc sort by note modification date in ascending order (most recent first)
    # modified_dec sort by note modification date in descending order (most recent last)
    # text_asc sort by the note text content from in ascending order (A to Z)
    # text_dec sort by the note text content from in descending order (Z to A)
    # @option params [Boolean] :full Whether or not to return full results.
    # @option params [Integer] :limit The number of results to return per page. The default is to return all results.
    # @option params [Integer] :offset The offset from which to collect results, with default of zero. The number of results is specified by limit.
    def notes(params={})
      connection.get do |req|
        req.url("notes", :bearer_token => @auth_token)
        req.params.merge!(params)
      end.body.notes
    end

    # Retrieves a single note
    #
    # @param [Integer] note_id Note ID
    # @option params [Boolean] :full Whether or not to return full results.
    def note(id)
      connection.get("notes/#{id}", :bearer_token => @auth_token).body.notes.first
    end

    # Create a new note.
    #
    # @option params [Integer] :latitude The latitude.
    # @option params [Integer] :longitude The longitude.
    # @option params [String] :source Source (application) which created note.
    # @option params [String] :text The text of the note
    # @option params [String] :mode The sharing settings for the note. If unset, private is implied. (public | private | shared)
    # @option params [Float] :accuracy_position The accuracy of coordinates from GPS.
    # @option params [Float] :altitude The altitude from GPS associated with the note.
    # @option params [Float] :bearing The bearing from GPS associated with the note
    # @option params [Float] :speed The speed from GPS associated with the note
    # @option params [Float] :speed The speed from GPS associated with the note
    # @option params [DateTime] :created_at Date at which the comment was created.
    # @option params [DateTime] :modified_at Date of last modification
    # @option params [DateTime] :reminder_at Will present a reminder at the time specified on supported devices
    # Waiting on annotations
    def add_note(params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.post "notes", payload
      response.body.notes.first
    end

    # Modify a note
    #
    # @option params [Integer] :latitude The latitude.
    # @option params [Integer] :longitude The longitude.
    # @option params [String] :source Source (application) which created note.
    # @option params [String] :text The text of the note
    # @option params [String] :mode The sharing settings for the note. If unset, private is implied. (public | private | shared)
    # @option params [Float] :accuracy_position The accuracy of coordinates from GPS.
    # @option params [Float] :altitude The altitude from GPS associated with the note.
    # @option params [Float] :bearing The bearing from GPS associated with the note
    # @option params [Float] :speed The speed from GPS associated with the note
    # @option params [Float] :speed The speed from GPS associated with the note
    # @option params [DateTime] :created_at Date at which the comment was created.
    # @option params [DateTime] :modified_at Date of last modification
    # @option params [DateTime] :reminder_at Will present a reminder at the time specified on supported devices
    # Waiting on annotations
    def modify_note(id, params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.post "notes/#{id}", payload
      response.body.notes.first
    end

    # Deletes a note, or annotations of a note if specified
    #
    # @param [Integer] note_id Note ID
    def delete_note(id)
      connection.delete("notes/#{id}").body.status == 'ok'
    end
  end
end
