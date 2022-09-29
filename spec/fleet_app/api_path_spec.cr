require "../spec_helper"

describe FleetApp::ApiPath do
  describe "#path" do
    it "returns the correct path when initialized in a default state" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host")
      api_path.path.should eq("/api/v1/valheim/servers/1?queue_name=sample.host")
    end
    it "returns the correct path when initialized with only an action" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host", action: "stop")
      api_path.path.should eq("/api/v1/valheim/servers/1/stop?queue_name=sample.host")
    end
    it "returns the correct path when initialized with an action and a username" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host", action: "stop", username: "testuser1")
      api_path.path.should eq("/api/v1/valheim/servers/1/stop?queue_name=sample.host&username=testuser1")
    end
    it "returns the correct path when initialized with only a username" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host", username: "testuser1")
      api_path.path.should eq("/api/v1/valheim/servers/1?queue_name=sample.host&username=testuser1")
    end
    it "returns the correct path when initialized with a username and a world" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host", username: "testuser1", world_name: "World1")
      api_path.path.should eq("/api/v1/valheim/servers/1?queue_name=sample.host&username=testuser1&world_name=World1")
    end
    it "returns the correct path when initialized with an action and a username and a world" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host", action: "start", username: "testuser1", world_name: "World1")
      api_path.path.should eq("/api/v1/valheim/servers/1/start?queue_name=sample.host&username=testuser1&world_name=World1")
    end
    it "returns the correct path when initialized with only a world" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host", world_name: "World1")
      api_path.path.should eq("/api/v1/valheim/servers/1?queue_name=sample.host&world_name=World1")
    end
  end
end
