module Catch
  module Search

    # Search the user's notes
    #
    # @param [String] :q The search query
    # @option params [Float] :lat Latitude in degrees
    # @option params [Float] :lng Longitude in degrees
    # @option params [String] :sort default is created_dec
    # Specifies a note sort order. Valid sort orders are:
    # created_asc sort by note creation date in ascending order (most recent first)
    # create_dec sort by note creation date in descending order (most recent last)
    # modified_asc sort by note modification date in ascending order (most recent first)
    # modified_dec sort by note modification date in descending order (most recent last)
    # text_asc sort by the note text content from in ascending order (A to Z)
    # text_dec sort by the note text content from in descending order (Z to A)
    # @option params [Boolean] :full Whether or not to return full results.
    # @option params [Integer] :limit The number of results to return per page. The default is to return all results.
    # @option params [Integer] :offset The offset from which to collect results, with default of zero. The number of results is specified by limit.
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
