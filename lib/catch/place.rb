module Catch
  module Place
    def places(params={})
      connection.get do |req|
        req.url("places")
        req.params.merge!(params)
      end.body.places
    end

#     def note(id)
#       connection.get("notes/#{id}").body.notes.first
#     end
# 
    def add_place(params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.put "places", payload
      response.body.places
    end

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
