module FleetApp
  class Server
    # Back up the loaded world of the specified game then restore and load the selected world.
    #
    # The server will need to be stopped, the current world will be backed up,
    # the target world will be restored, then the server will be restarted.
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
    def self.backup_and_restore(
      host : String, game_name : String, server_id : String, body : String = "", environment : String = "production",
      username : String = "", loaded_world_name : String = "", loaded_backup_date : String = "", server_type : String = "",
      loaded_world_id : String = "", loaded_backup_id : String = "", restoration_url : String = "",
      restoration_world_name : String = "", restoration_backup_date : String = "", restoration_world_id : String = "",
      server_name : String = ""
    )
      FleetApp::ClientWrapper.new(environment).post(
        game_name: game_name,
        path: ApiPath.new(
          game_name, server_id, host, "backup_and_restore", {
          "username" => username, "loaded_world_name" => loaded_world_name,
          "loaded_backup_date" => loaded_backup_date, "server_type" => server_type,
          "environment" => environment, "loaded_world_id" => loaded_world_id,
          "loaded_backup_id" => loaded_backup_id, "restoration_url" => restoration_url,
          "restoration_world_name" => restoration_world_name,
          "restoration_backup_date" => restoration_backup_date,
          "restoration_world_id" => restoration_world_id,
          "server_name" => server_name,
        }).path,
        body: body
      )
    end

    def self.backup_and_restore_with_auth(
      host : String, game_name : String, server_id : String, basic_auth : String, body : String = "",
      environment : String = "production", username : String = "", loaded_world_name : String = "",
      loaded_backup_date : String = "", server_type : String = "", loaded_world_id : String = "",
      loaded_backup_id : String = "", restoration_url : String = "", restoration_world_name : String = "",
      restoration_backup_date : String = "", restoration_world_id : String = "", server_name : String = ""
    )
      FleetApp::ClientWrapper.new(environment).post_with_auth(
        game_name: game_name,
        path: ApiPath.new(
          game_name, server_id, host, "backup_and_restore", {
          "username" => username, "loaded_world_name" => loaded_world_name,
          "loaded_backup_date" => loaded_backup_date, "server_type" => server_type,
          "environment" => environment, "loaded_world_id" => loaded_world_id,
          "loaded_backup_id" => loaded_backup_id, "restoration_url" => restoration_url,
          "restoration_world_name" => restoration_world_name,
          "restoration_backup_date" => restoration_backup_date,
          "restoration_world_id" => restoration_world_id,
          "server_name" => server_name,
        }).path,
        body: body,
        basic_auth: basic_auth
      )
    end
  end
end
