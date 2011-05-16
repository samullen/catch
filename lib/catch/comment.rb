module Catch
  module Comment
    def comments(note_id, params={})
      connection.get do |req|
        req.url("comments/#{note_id}")
        req.params.merge!(params)
      end.body.notes
    end

    def comment(note_id, comment_id)
      params = {:comment => comment_id}
      connection.get do |req|
        req.url("comment/#{note_id}")
        req.params.merge!(params)
      end.body.notes.first
    end

    def add_comment(note_id, params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.post "comments/#{note_id}", payload
      response.body.notes.first
    end

    def modify_comment(note_id, comment_id, params={})
      payload = {:comment => comment_id }
      payload.merge! params

      response = connection.post do |req|
        req.url("comments/#{note_id}")
        req.params.merge!(payload)
      end.body.notes.first
    end

    def delete_comment(note_id, comment_id)
      connection.delete("comments/#{note_id}?comment=#{comment_id}").body.status == 'ok'
    end
  end
end
