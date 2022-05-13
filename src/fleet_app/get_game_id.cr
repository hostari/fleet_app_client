# Used to get the game_id for CoreKeeper

module FleetApp
  class Server
    def self.get_game_id(host : String, game_name : String, server_id : String)
      client = FleetApp::Client.new(host)
      response = client.get("/api/v1/#{game_name}/servers/#{server_id}/game_id")
      if response.status_code == 200
        JSON.parse(response.body)
      else
        raise Error.new(response.status_code.to_s)
      end
    end
  end
end
