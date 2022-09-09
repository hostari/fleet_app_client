module FleetApp
  class ApiPath
    getter path : String

    API_VERSION = "v1"

    def initialize(game_name : String, server_id : String, host : String, username : String = "", action : String = "")
      if action == "" && username == ""
        @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}?queue_name=#{host}"
      elsif action == "" && !username == ""
        @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}?queue_name=#{host}&username=#{username}"
      elsif !action == "" && !username == ""
        @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}/#{action}?queue_name=#{host}&username=#{username}"
      elsif !action == "" && username == ""
        @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}/#{action}?queue_name=#{host}"
      end
    end
  end
end
