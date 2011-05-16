module Catch
  module Note
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

#     def add_note(params={})
#       payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
#       response = connection.post "notes", payload
#       response.body.notes.first
#     end
# 
#     def modify_note(id, params={})
#       payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
#       response = connection.post "notes/#{id}", payload
#       response.body.notes.first
#     end
# 
#     def delete_note(id)
#       connection.delete("notes/#{id}").body.status == 'ok'
#     end
  end
end
