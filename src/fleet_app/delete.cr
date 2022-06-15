module FleetApp
  class Server
    def self.delete(host : String, game_name : String, server_id : String, body : String = "", environment : String = "production")
      if environment == "production"
        client = FleetApp::Client.new
      else
        client = FleetApp::Client.new("sandbox-fleet.hostari.com")
      end

      client.post("/api/v1/#{game_name}/servers/#{server_id}/delete?queue_name=#{host}", body)
    end
  end
end
