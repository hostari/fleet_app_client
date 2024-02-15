module FleetApp
  class Server
    # Updates a specified game's configuration.
    #
    # This is called when updating a server configuration file which is different for each game.
    # The server will need to be stopped before any configuration files are edited, then the server will be restarted.
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
    # `body` is an optional, JSON-formatted string that is sent as the request body which defaults to an empty string.
    # This is used to override the default command in fleet app.
    # For example, you can send this: `{command: "echo 'foobar'"}.to_json`
    #
    # `environment` is an optional string that specifies which fleet app to send the request to.
    def self.update_config(
      host : String,
      game_name : String,
      server_id : String,
      body : String = "",
      environment : String = "production",
      username : String = "",
      world_name : String = "",
      server_type : String = ""
    )
      FleetApp::ClientWrapper.new(environment).post(
        game_name: game_name,
        path: build_api_path(game_name, server_id, host, username, world_name, server_type),
        body: body
      )
    end

    def self.update_config_with_auth(
      host : String, game_name : String, server_id : String, basic_auth : String, body : String = "",
      environment : String = "production", username : String = "", world_name : String = "",
      server_type : String = ""
    )
      FleetApp::ClientWrapper.new(environment).post_with_auth(
        game_name: game_name,
        path: build_api_path(game_name, server_id, host, username, world_name, server_type),
        body: body,
        basic_auth: basic_auth
      )
    end

    private def self.build_api_path(game_name, server_id, host, username, world_name, server_type)
      ApiPath.new(game_name, server_id, host, "update_config", {"username" => username, "world_name" => world_name, "server_type" => server_type}).path
    end
  end
end
