module FleetApp
  class ApiResult
    include JSON::Serializable

    getter message : String
    getter status_code : Int32

    def success?
      status_code == 200
    end
  end
end
