module FleetApp
  class Client
    property host : String

    def initialize(@host : String = FleetAppClient::HOST)
    end

    # Sets the host. Alias of `host=`.
    def set_host(host : String)
      @host = host
    end

    # Returns the base url for which this client will make API requests to.
    def base_url : URI
      if host.starts_with?("localhost")
        URI.parse("http://#{host}")
      else
        URI.parse("https://#{host}")
      end
    end

    # Performs a GET request on the path.
    def get(path : String)
      HTTP::Client.new(base_url).get(path)
    end

    # Performs a POST request on the path with a body.
    def post(path : String, body : String)
      HTTP::Client.new(base_url)
        .post(path, headers: HTTP::Headers{"X-Auth-Token" => ""}, body: body)
    end
  end
end
