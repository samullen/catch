module Catch
  module User
    def user
      connection.get("user").body.user
    end
  end
end
