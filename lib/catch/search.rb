module Catch
  module Search
    def search(query, params={})
      params[:q] = query

      connection.get do |req|
        req.url("search")
#         req.params = params
        req.params.merge!(params)
      end.body.notes
    end
  end
end
