module FleetApp
  class ApiPath
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

  class ApiPathV2
    getter path : String

    API_VERSION = "v1"
    BASE_PATH = "/api/#{API_VERSION}"

    def initialize(game_name : String, server_id : String, @host : String)
      raw_path = "#{BASE_PATH}/#{game_name}/servers/#{server_id}?queue_name=#{@host}"
      @path = URI.encode_path(raw_path)
    end

    def initialize(game_name : String, server_id : String, @host : String, options : NamedTuple(action: String))
      raw_path = "#{BASE_PATH}/#{game_name}/servers/#{server_id}/#{options[:action]}?queue_name=#{host}"
      @path = URI.encode_path(raw_path)
    end

    def initialize(game_name : String, server_id : String, @host : String, options : NamedTuple(action: String, params: Hash(String, String)))
      raw_path = "#{BASE_PATH}/#{game_name}/servers/#{server_id}/#{options[:action]}?#{query_string(options)}"
      @path = URI.encode_path(raw_path)
    end

    private def query_string(options : NamedTuple(action: String, params: Hash(String, String)))
      params = URI::Params.build do |form|
        form.add "queue_name", @host
        options[:params].each do |param, value|
          form.add param, value
        end
      end
      params
    end
  end
end
