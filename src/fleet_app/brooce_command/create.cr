module FleetApp
  class Server
    class BrooceCommand
      def self.create(host : String, game_name : String, server_id : String, command : String = "")
        client = FleetApp::Client.new

        begin
          response = client.post(
            "/api/v1/#{game_name}/servers/#{server_id}/brooce_command?queue_name=#{host}",
            {command: command}.to_json
          )

          if response.status_code == 200
            ApiResult.from_json(response.body)
          else
            ErrorResult.from_json(response.body)
          end
        rescue e
          ErrorResult.new(e.message || e.stacktrace)
        end
      end
    end
  end
end
