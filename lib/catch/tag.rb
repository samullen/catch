module Catch
  module Tag

    # Provide a list of all tags in this user's notes. The response provides
    # count (number of notes using this tag) and modified (most recent
    # timestamp when a note using this tag was modified) properties for each
    # tag
    def tags
      connection.get("tags").body.tags
    end
  end
end
