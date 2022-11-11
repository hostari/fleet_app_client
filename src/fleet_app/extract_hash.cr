module FleetApp
  class ModLibrary
    # Downloads a mod as a zip file from a library (e.g. Thunderstore) into /srv/{mod_library} folder of tms7,
    # unzips the file, and walks through each of the directories to extract the sha256 hashes from each file.

    # Host will always be tms7 and does not require a server_id.
    #
    # Use `game_name` to specify the game you are sending a brooce command for.
    # See: `FleetApp::Game` for possible values.
    #
    # `body` is an optional, JSON-formatted string that is sent as the request body which defaults to an empty string.
    # This is used to override the default command in fleet app.
    # For example, you can send this: `{command: "echo 'foobar'"}.to_json`
    #
    # `environment` is an optional string that specifies which fleet app to send the request to.

    def self.extract_hash(host : String, command : String = "", environment : String = "production", username : String = "")
      FleetApp::ClientWrapper.new(environment).post(
        game_name: game_name,
        path: "/api/v1/mod_library/brooce_command?queue_name=#{host}",
        body: {command: command}.to_json
      )
    end

    def self.extract_hash_with_auth(host : String, basic_auth : String, command : String = "", environment : String = "production", username : String = "")
      FleetApp::ClientWrapper.new(environment).post_with_auth(
        game_name: game_name,
        path: "/api/v1/mod_library/brooce_command?queue_name=#{host}",
        body: {command: command}.to_json,
        basic_auth: basic_auth
      )
    end
  end
end
