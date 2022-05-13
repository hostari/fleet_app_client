describe FleetApp::Server do
  it "returns a game_id" do
    server_id = "1234"
    host = "2013197.xyz"
    WebMock.stub(:get, "https://#{host}/api/v1/core_keeper/servers/#{server_id}/game_id").to_return(status: 200, body: File.read("spec/support/servers/#{server_id}/game_id.json"))
    game_id = FleetApp::Server.get_game_id(host, "core_keeper", server_id)
    game_id.should eq(JSON.parse(File.read("spec/support/servers/#{server_id}/game_id.json")))
  end

  it "starts a server" do
    server_id = "1234"
    host = "2013197.xyz"
    WebMock.stub(:post, "https://#{host}/api/v1/valheim/servers/#{server_id}/start")
      .with(body: "Starting Server", headers: {"X-Auth-Token" => ""})
      .to_return(body: "", headers: {"X-Error" => "true"})

    response = FleetApp::Server.start(host, "valheim", server_id, "Starting Server")
    response.status_code.should eq(200)
  end

  it "stops a server" do
    server_id = "1234"
    host = "2013197.xyz"
    WebMock.stub(:post, "https://#{host}/api/v1/core_keeper/servers/#{server_id}/stop")
      .with(body: "Stopping Server", headers: {"X-Auth-Token" => ""})
      .to_return(body: "", headers: {"X-Error" => "true"})

    response = FleetApp::Server.stop(host, "core_keeper", server_id, "Stopping Server")
    response.status_code.should eq(200)
  end

  it "restarts a server" do
    server_id = "1234"
    host = "2013197.xyz"
    WebMock.stub(:post, "https://#{host}/api/v1/valheim/servers/#{server_id}/restart")
      .with(body: "Restarting Server", headers: {"X-Auth-Token" => ""})
      .to_return(body: "", headers: {"X-Error" => "true"})

    response = FleetApp::Server.restart(host, "valheim", server_id, "Restarting Server")
    response.status_code.should eq(200)
  end

  it "creates a server" do
    server_id = "1234"
    host = "2013197.xyz"
    WebMock.stub(:post, "https://#{host}/api/v1/core_keeper/servers/#{server_id}")
      .with(body: "Server created", headers: {"X-Auth-Token" => ""})
      .to_return(body: "", headers: {"X-Error" => "true"})

    response = FleetApp::Server.create(host, "core_keeper", server_id, "Server created")
    response.status_code.should eq(200)
  end
end
