module FleetApp
  class Server
    def self.create(host : String, game_name : String, server_id : String, body : String = "")
      client = FleetApp::Client.new(ENV["FLEET_HOST"])
      client.post("/api/v1/#{game_name}/servers/#{server_id}?queue_name=#{host}", body)
    end
  end
end
