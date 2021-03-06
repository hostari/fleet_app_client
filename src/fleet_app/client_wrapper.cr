module FleetApp
  # Wraps over the client's response bodies and returns result objects.
  class ClientWrapper
    def initialize(environment : String, client : FleetApp::Client? = nil)
      @environment = environment

      if client
        # Use the client passed in if it is available and override environment
        @client = client.not_nil!
      else
        # Instantiate a client based on the environment passed in
        if @environment == "production"
          @client = FleetApp::Client.new
        else
          @client = FleetApp::Client.new(FleetAppClient::SANDBOX_HOST)
        end
      end
    end

    def post(game_name : String, path : String, body : String)
      begin
        raise FleetApp::Error.new("Game '#{game_name}' not supported.") if !FleetApp::Game::LIST.includes?(game_name)

        response = @client.post(path, body)

        if response.status_code == 200
          ApiResult.from_json(response.body)
        else
          ErrorResult.from_json(response.body)
        end
      rescue e
        ErrorResult.new(e.message || e.backtrace.join(','))
      end
    end

    def get(game_name : String, path : String)
      begin
        raise FleetApp::Error.new("Game '#{game_name}' not supported.") if !FleetApp::Game::LIST.includes?(game_name)

        response = @client.get(path)

        if response.status_code == 200
          ApiResult.from_json(response.body)
        else
          ErrorResult.from_json(response.body)
        end
      rescue e
        ErrorResult.new(e.message || e.backtrace.join(','))
      end
    end
  end
end
