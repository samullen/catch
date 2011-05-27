module Catch
  module User

    # Retrieve information about the current user
    def user
      connection.get("user").body.user
    end
  end
end
