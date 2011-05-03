module Catch
  module Note
    def notes
      connection.get("notes").body
    end

    def note(id)
      connection.get("notes/#{id}").body
    end
  end
end
