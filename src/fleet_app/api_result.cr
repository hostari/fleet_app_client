module FleetApp
  # The "happy" result from an API call.
  class ApiResult
    include JSON::Serializable

    getter message : String
    getter status_code : Int32

    # Returns `true` if `status_code` is `200`, `false` otherwise.
    def success?
      status_code == 200
    end
  end
end
