# Used to get the details for other games aside from CoreKeeper

module FleetApp
  class Server
    def self.get_details(host : String, game_name : String, server_id : String)
      client = FleetApp::Client.new
      response = client.get("/api/v1/#{game_name}/servers/#{server_id}?queue_name=#{host}")
      if response.status_code == 200
        JSON.parse(response.body)
      else
        raise Error.new(response.status_code.to_s)
      end
    end
  end
end
