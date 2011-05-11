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

    def create_note(text)
      payload = "text=#{text}"
      response = connection.post "notes", payload
      response.body.notes.first
    end

    def delete_note(id)
      connection.delete("notes/#{id}").body.status == 'ok'
    end
  end
end
