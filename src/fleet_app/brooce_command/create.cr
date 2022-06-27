module FleetApp
  class Server
    class BrooceCommand
      # Sends a brooce command to be executed.
      #
      # Use `host` to specify the queue name in brooce to send to.
      # For example, use `2013191.xyz` if the command should be executed on tms1.
      # If you don't know which queue to send to, the SRE lead should be able to advise you
      # based on how they configured brooce.
      #
      # Use `game_name` to specify the game you are sending a brooce command for.
      # See: `FleetApp::Game` for possible values.
      #
      # Use `server_id` to specify the internal Hostari id. Can be a `subscription_id` from GamesSite,
      # or a `server_id` from VSH.
      #
      # Use `command` to specify the command to be executed using brooce.
      def self.create(host : String, game_name : String, server_id : String, command : String = "", environment : String = "production")
        FleetApp::ClientWrapper.new(environment).post(
          game_name: game_name,
          path: "/api/v1/#{game_name}/servers/#{server_id}/brooce_command?queue_name=#{host}",
          body: {command: command}.to_json
        )
      end
    end
  end
end
