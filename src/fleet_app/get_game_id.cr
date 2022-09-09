module FleetApp
  class Server
    # Used to get the game_id for Core Keeper servers
    #
    # Use `host` to specify the queue name in brooce to send to.
    # For example, use `2013191.xyz` if the command should be executed on tms1.
    # If you don't know which queue to send to, the SRE lead should be able to advise you
    # based on how they configured brooce.
    #
    # Use `game_name` to specify the game you are sending a brooce command for.
    # Only accepts `FleetApp::Game::CORE_KEEPER`.
    #
    # Use `server_id` to specify the internal Hostari id. Can be a `subscription_id` from GamesSite,
    # or a `server_id` from VSH.
    #
    # `environment` is an optional string that specifies which fleet app to send the request to.
    def self.get_game_id(host : String, game_name : String, server_id : String, environment : String = "production")
      FleetApp::ClientWrapper.new(environment).get(
        game_name: game_name,
        path: ApiPath.new(game_name, server_id, host, action: "game_id").path
      )
    end
  end
end
