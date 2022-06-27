# module FleetApp
#   class Server
#     # Fetches game server details
#     #
#     # Use `host` to specify the queue name in brooce to send to.
#     # For example, use `2013191.xyz` if the command should be executed on tms1.
#     # If you don't know which queue to send to, the SRE lead should be able to advise you
#     # based on how they configured brooce.
#     #
#     # Use `game_name` to specify the game you are sending a brooce command for.
#     # See: `FleetApp::Game` for possible values.
#     #
#     # Use `server_id` to specify the internal Hostari id. Can be a `subscription_id` from GamesSite,
#     # or a `server_id` from VSH.
#     #
#     # `body` is an optional, JSON-formatted string that is sent as the request body which defaults to an empty string.
#     #
#     # `environment` is an optional string that specifies which fleet app to send the request to.
#     def self.get_details(host : String, game_name : String, server_id : String, environment : String = "production")
#       client = FleetApp::Client.new(environment)
#       response = client.get("/api/v1/#{game_name}/servers/#{server_id}?queue_name=#{host}")
#       if response.status_code == 200
#         JSON.parse(response.body)
#       else
#         raise Error.new(response.status_code.to_s)
#       end
#     end
#   end
# end
