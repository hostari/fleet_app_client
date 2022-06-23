module FleetApp
  class ErrorResult
    include JSON::Serializable

    def initialize(@message : String, @status_code : Int32 = 500)
    end

    getter message : String
    getter status_code : Int32

    def success?
      status_code == 200
    end
  end
end
