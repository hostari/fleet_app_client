require "../spec_helper"

describe FleetApp::ApiPath do
  describe "#path" do
    it "returns the correct path when initialized with no action" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host")
      api_path.path.should eq("/api/v1/valheim/servers/1?queue_name=sample.host")
    end
    it "returns the correct path when initialized with an action" do
      api_path = FleetApp::ApiPath.new("valheim", "1", "sample.host", "stop")
      api_path.path.should eq("/api/v1/valheim/servers/1/stop?queue_name=sample.host")
    end
  end
end
