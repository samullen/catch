module Catch
  module Note
    def notes
      connection.get("notes").body.notes
    end

    def note(id)
      connection.get("notes/#{id}").body.notes.first
    end
  end
end
