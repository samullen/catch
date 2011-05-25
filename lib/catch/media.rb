module Catch
  module Media

    def add_media(id, filepath, params={})
      params.merge!({:data => Faraday::UploadIO.new(filepath, 'image/jpeg')})

      connection.put("media/#{id}", params).body
    end

    def media(note_id, media_id, params={})
      media_connection.get do |req|
        req.url("media/#{note_id}/#{media_id}")
        req.params.merge!(params)
      end.body
    end

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
