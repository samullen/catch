module Catch
  module Media

    def add_media(id, filepath, params={})
      params.merge!({:data => Faraday::UploadIO.new(filepath, 'image/jpeg')})

      connection.put("media/#{id}", params).body
    end


    def media(note_id, media_id, params={})
      connection.get do |req|
        req.url("media/#{note_id}/#{media_id}")
        req.params.merge!(params)
      end.body.notes
    end

    def delete_media(note_id, media_id)
      connection.delete("media/#{note_id}/#{media_id}").body.status == 'ok'
    end

    def shared_media(note_id, media_id, params={})
    end
  end
end
