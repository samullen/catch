module Catch
  module Note
    def notes(params={})
      connection.get do |req|
        req.url("notes")
        req.params.merge!(params)
      end.body.notes
    end

    def note(id)
      connection.get("notes/#{id}").body.notes.first
    end

    def add_note(params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.post "notes", payload
      response.body.notes.first
    end

    def modify_note(id, params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.post "notes/#{id}", payload
      response.body.notes.first
    end

    def delete_note(id)
      connection.delete("notes/#{id}").body.status == 'ok'
    end
  end
end
