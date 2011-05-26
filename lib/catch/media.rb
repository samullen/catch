module Catch
  module Media

    # Adds a file to a note.
    #
    # @param [Integer] note_id Note ID
    # @param [String] filepath The full path to the file to add to the note
    # @option params [String] :content_type The content type 
    # @option params [String] :content_type The content type 
    # @option params [Boolean] :voicenote_hunt If this media is a voicenote
    # @option params [DateTime] :created_at Date at which the comment was created.
    # @option params [DateTime] :server_modified_at Providing the server_modified_at timestamp will ensure that the object being modified is not out of date.
    def add_media(id, filepath, params={})
      params.merge!({:data => Faraday::UploadIO.new(filepath, 'image/jpeg')})

      connection.put("media/#{id}", params).body
    end

    # Return the media file
    #
    # @param [Integer] note_id Note ID
    # @param [String] media_id Media ID
    # @option params [String] :size For images, the size to which to scale the image.
    # small images are at most 128 pixels in the longer dimension.
    # medium images are at most 800 pixels in the longer dimension.
    # large images are at most 9999 pixels in the longer dimension.
    # @option params [boolean] :original For images whether or not to return the original unscaled image. The scaling process removes all additional metadata, including EXIF geocoding. You must use this flag if you want to retain such data.
    def media(note_id, media_id, params={})
      media_connection.get do |req|
        req.url("media/#{note_id}/#{media_id}")
        req.params.merge!(params)
      end.body
    end

    # Deletes a file attachment from a note
    #
    # @param [Integer] note_id Note ID
    # @param [String] media_id Media ID
    def delete_media(note_id, media_id)
      connection.delete("media/#{note_id}/#{media_id}").body.status == 'ok'
    end

    # It really doesn't look like shared_media has any value at this point
    # since all it is doing is retrieving a file from the url key of the media
    # object. Skipping until this has value.

#     def shared_media(note_id, media_id, params={})
#       media_connection.get do |req|
#         req.url("media/#{note_id}/#{media_id}")
#         req.params.merge!(params)
#       end.body
#     end
  end
end
