module Catch
  module Place

    # Lists all places for the user
    #
    def places(params={})
      connection.get do |req|
        req.url("places")
        req.params.merge!(params)
      end.body.result
    end

    # Returns a place by id
    #
    # @param [Integer] :id The id of a place
    def place(id)
      connection.get("places/#{id}").body
    end

    # Add a place
    #
    # @param [Integer] :latitude The latitude.
    # @param [Integer] :longitude The longitude.
    # @option params [String] :address The address of the place.
    # @option params [String] :name The name of the place
    # @option params [String] :phone A phone number for the place
    # @option params [Integer] :rating A rating for the place (0 - 5)
    # @option params [DateTime] :created_at Date at which the comment was created.
    # @option params [DateTime] :modified_at Date of last modification
    # @option params [String] :category A category for the place
    # Waiting on annotations
    def add_place(latitude, longitude, params={})
      params[:latitude] = latitude
      params[:longitude] = longitude
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.put "places", payload
      response.body.result
    end

    # Modifies the properties of a place
    #
    # @param [Integer] :id The id of a place
    # @option params [Integer] :latitude The latitude.
    # @option params [Integer] :longitude The longitude.
    # @option params [String] :address The address of the place.
    # @option params [String] :name The name of the place
    # @option params [String] :phone A phone number for the place
    # @option params [Integer] :rating A rating for the place (0 - 5)
    # @option params [DateTime] :created_at Date at which the comment was created.
    # @option params [DateTime] :modified_at Date of last modification
    # @option params [String] :category A category for the place
    # @option params [DateTime] :server_modified_at Providing the server_modified_at timestamp will ensure that the object being modified is not out of date
    # Waiting on annotations
    def modify_place(id, params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.post "places/#{id}", payload
      response.body.result
    end

    # Deletes the place
    #
    # @param [Integer] :id The id of a place
    def delete_place(id)
      connection.delete("places/#{id}").body.status == 'ok'
    end
  end
end
