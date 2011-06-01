module Catch
  module Place
    def places(params={})
      connection.get do |req|
        req.url("places")
        req.params.merge!(params)
      end.body.result
    end

    def place(id)
      connection.get("places/#{id}").body
    end

    def add_place(latitude, longitude, params={})
      params[:latitude] = latitude
      params[:longitude] = longitude
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.put "places", payload
      response.body.result
    end

    def modify_place(id, params={})
      payload = params.map {|k,v| "#{k}=#{v}"}.join("&")
      response = connection.post "places/#{id}", payload
      response.body.result
    end

    def delete_place(id)
      connection.delete("places/#{id}").body.status == 'ok'
    end
  end
end
