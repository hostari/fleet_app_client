require "../spec_helper"

describe FleetApp::Server do
  describe ".create" do
    it "returns an ApiResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"

      WebMock.stub(:post, "#{root_path}/api/v1/v_rising/servers/#{server_id}?queue_name=#{queue_name}")
        .with(body: "", headers: {"X-Auth-Token" => ""})
        .to_return(status: 200, body: File.read("spec/support/v_rising/servers/delete.json"))

      result = FleetApp::Server.create(queue_name, "v_rising", server_id, environment: "production")

      result.should be_a(FleetApp::ApiResult)
    end
    it "returns an ErrorResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"
      game_name = "invalid-game-name"

      result = FleetApp::Server.create(
        queue_name,
        game_name,
        server_id,
        environment: "production"
      )

      result.should be_a(FleetApp::ErrorResult)
    end
  end
  describe ".delete" do
    it "returns an ApiResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"

      WebMock.stub(:post, "#{root_path}/api/v1/v_rising/servers/#{server_id}/delete?queue_name=#{queue_name}")
        .with(body: "", headers: {"X-Auth-Token" => ""})
        .to_return(status: 200, body: File.read("spec/support/v_rising/servers/delete.json"))

      result = FleetApp::Server.delete(queue_name, "v_rising", server_id, environment: "production")

      result.should be_a(FleetApp::ApiResult)
    end
    it "returns an ErrorResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"
      game_name = "invalid-game-name"

      result = FleetApp::Server.delete(
        queue_name,
        game_name,
        server_id,
        environment: "production"
      )

      result.should be_a(FleetApp::ErrorResult)
    end
  end
  describe ".get_game_id" do
    it "returns an ApiResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"

      WebMock.stub(:get, "#{root_path}/api/v1/core_keeper/servers/#{server_id}/game_id?queue_name=#{queue_name}")
        # .with(headers: {"X-Auth-Token" => ""})
        .to_return(status: 200, body: File.read("spec/support/core_keeper/servers/game_id.json"))

      result = FleetApp::Server.get_game_id(queue_name, "core_keeper", server_id, environment: "production")

      result.should be_a(FleetApp::ApiResult)
    end
    it "returns an ErrorResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"
      game_name = "invalid-game-name"

      result = FleetApp::Server.get_game_id(
        queue_name,
        game_name,
        server_id,
        environment: "production"
      )

      result.should be_a(FleetApp::ErrorResult)
    end
  end
  describe ".restart" do
    it "returns an ApiResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"

      WebMock.stub(:post, "#{root_path}/api/v1/v_rising/servers/#{server_id}/restart?queue_name=#{queue_name}")
        .with(body: "", headers: {"X-Auth-Token" => ""})
        .to_return(status: 200, body: File.read("spec/support/v_rising/servers/restart.json"))

      result = FleetApp::Server.restart(queue_name, "v_rising", server_id, environment: "production")

      result.should be_a(FleetApp::ApiResult)
    end
    it "returns an ErrorResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"
      game_name = "invalid-game-name"

      result = FleetApp::Server.restart(
        queue_name,
        game_name,
        server_id,
        environment: "production"
      )

      result.should be_a(FleetApp::ErrorResult)
    end
  end
  describe ".start" do
    it "returns an ApiResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"

      WebMock.stub(:post, "#{root_path}/api/v1/v_rising/servers/#{server_id}/start?queue_name=#{queue_name}")
        .with(body: "", headers: {"X-Auth-Token" => ""})
        .to_return(status: 200, body: File.read("spec/support/v_rising/servers/start.json"))

      result = FleetApp::Server.start(queue_name, "v_rising", server_id, environment: "production")

      result.should be_a(FleetApp::ApiResult)
    end
    it "returns an ErrorResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"
      game_name = "invalid-game-name"

      result = FleetApp::Server.start(
        queue_name,
        game_name,
        server_id,
        environment: "production"
      )

      result.should be_a(FleetApp::ErrorResult)
    end
  end
  describe ".stop" do
    it "returns an ApiResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"

      WebMock.stub(:post, "#{root_path}/api/v1/v_rising/servers/#{server_id}/stop?queue_name=#{queue_name}")
        .with(body: "", headers: {"X-Auth-Token" => ""})
        .to_return(status: 200, body: File.read("spec/support/v_rising/servers/stop.json"))

      result = FleetApp::Server.stop(queue_name, "v_rising", server_id, environment: "production")

      result.should be_a(FleetApp::ApiResult)
    end
    it "returns an ErrorResult" do
      server_id = "1234"
      root_path = "https://fleet.hostari.com"
      queue_name = "sample.host"
      game_name = "invalid-game-name"

      result = FleetApp::Server.stop(
        queue_name,
        game_name,
        server_id,
        environment: "production"
      )

      result.should be_a(FleetApp::ErrorResult)
    end
  end
end
