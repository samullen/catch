module Catch
  module Tag
    def tags
      connection.get("tags").body.tags
    end
  end
end
