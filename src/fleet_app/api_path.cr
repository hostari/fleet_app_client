module FleetApp
  class ApiPath
    getter path : String

    API_VERSION = "v1"

    def initialize(game_name : String, server_id : String, host : String, world_name : String = "", username : String = "", action : String = "")
      if username == ""
        if world_name == ""
          if action == ""
            @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}?queue_name=#{host}"
          else
            @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}/#{action}?queue_name=#{host}"
          end
        else
          if action == ""
            @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}?queue_name=#{host}&world_name=#{world_name}"
          else
            @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}/#{action}?queue_name=#{host}&world_name=#{world_name}"
          end
        end
      else
        if world_name == ""
          if action == ""
            @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}?queue_name=#{host}&username=#{username}"
          else
            @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}/#{action}?queue_name=#{host}&username=#{username}"
          end
        else
          if action == ""
            @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}?queue_name=#{host}&username=#{username}&world_name=#{world_name}"
          else
            @path = "/api/#{API_VERSION}/#{game_name}/servers/#{server_id}/#{action}?queue_name=#{host}&username=#{username}&world_name=#{world_name}"
          end
        end
      end
    end
  end
end
