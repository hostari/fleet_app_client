module FleetApp
  # Error result class for runtime errors.
  class Error < Exception
    property message : String?

    def initialize(@message)
    end
  end
end
