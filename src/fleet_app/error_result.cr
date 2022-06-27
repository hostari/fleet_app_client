module FleetApp
  # The "sad" result from an API call.
  class ErrorResult
    include JSON::Serializable

    def initialize(@message : String, @status_code : Int32 = 500)
    end

    getter message : String
    getter status_code : Int32

    # Returns `true` if `status_code` is `200`, `false` otherwise.
    def success?
      status_code == 200
    end
  end
end
