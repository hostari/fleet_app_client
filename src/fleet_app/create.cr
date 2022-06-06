module FleetApp
  class Server
    def self.create(host : String, game_name : String, server_id : String, body : String = "")
      client = FleetApp::Client.new(host)
      client.tls.verify_mode = OpenSSL::SSL::VerifyMode::NONE
      client.post("/api/v1/#{game_name}/servers/#{server_id}", body)
    end
  end
end
