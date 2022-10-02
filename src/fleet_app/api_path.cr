module FleetApp
  class ApiPath
    getter path : String

    API_VERSION = "v1"
    BASE_PATH = "/api/#{API_VERSION}"

    def initialize(game_name : String, server_id : String, @host : String, action : String? = nil, params : Hash(String, String) = {} of String => String)
      if !action.nil?
        @path = "#{BASE_PATH}/#{game_name}/servers/#{server_id}/#{action}?#{query_string(params)}"
      else
        @path = "#{BASE_PATH}/#{game_name}/servers/#{server_id}?#{query_string(params)}"
      end
    end

    private def query_string(params : Hash(String, String))
      params = URI::Params.build do |form|
        form.add "queue_name", @host
        params.each do |param, value|
          form.add param, value if !value.empty?
        end
      end
      params
    end
  end
end
