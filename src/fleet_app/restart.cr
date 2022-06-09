module FleetApp
  class Server
    FLEET_HOST = "fleet.hostari.com"

    def self.restart(host : String, game_name : String, server_id : String, body : String = "")
      client = FleetApp::Client.new(FLEET_HOST)
      client.post("/api/v1/#{game_name}/servers/#{server_id}/restart?queue_name=#{host}", body)
    end
  end
end
