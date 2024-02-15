module FleetApp
  # An `ApiPath` is responsible for generating a URL path to initiate an action on
  # the fleet.
  class ApiPath
    # After initializing an `ApiPath` with your information, use this method to get
    # the path.
    getter path : String

    # The API version that the fleet is currently using. As of 2024-02-13, we only
    # have a "v1".
    API_VERSION = "v1"
    # The beginning part of the path that is generated.
    BASE_PATH = "/api/#{API_VERSION}"

    # Initializes an `ApiPath`
    # Parameters:
    # - `game_name` is the underscored name of the game you want to perform an
    # action on. See: `FleetApp::Game` for possible values.
    # - `server_id` is the server id from the valheimserverhosting app or GamesSite
    # app that you want to perform an action on.
    # - `action` is the name of the action.
    # - `params` represents the query params that will be encoded as a string at the
    # end of the path.
    def initialize(game_name : String, server_id : String, @host : String, action : String? = nil, params : Hash(String, String) = {} of String => String)
      if !action.nil?
        @path = "#{BASE_PATH}/#{game_name}/servers/#{server_id}/#{action}?#{query_string(params)}"
      else
        @path = "#{BASE_PATH}/#{game_name}/servers/#{server_id}?#{query_string(params)}"
      end
    end

    # Returns the query string generated from `params`
    private def query_string(params : Hash(String, String))
      params = URI::Params.build do |form|
        # queue_name is always included
        form.add "queue_name", @host
        params.each do |param, value|
          # only add non-empty strings
          form.add param, value if !value.empty?
        end
      end
      params
    end
  end
end
