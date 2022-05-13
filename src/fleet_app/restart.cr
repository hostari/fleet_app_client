module FleetApp
  class Server
    def self.restart(host : String, game_name : String, server_id : String, body : String)
      client = FleetApp::Client.new(host)
      client.post("/api/v1/#{game_name}/servers/#{server_id}/restart", body)
    end
  end
end
