module FleetApp
  class Server
    class BrooceCommand
      def self.create(host : String, game_name : String, server_id : String, command : String = "")
        client = FleetApp::Client.new(host)
        client.post("/api/v1/#{game_name}/servers/#{server_id}/brooce_command", {command: command}.to_json)
      end
    end
  end
end
