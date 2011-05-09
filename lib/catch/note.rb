module Catch
  module Note
    def notes
      connection.get("notes").body.notes
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
p 'xxxxx'
      response = connection.delete "notes/#{id}"
p 'xxxxx' + response
    end
  end
end
