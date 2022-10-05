require "../spec_helper"

describe FleetApp::ClientWrapper do
  describe "#new" do
    it "Client returns the correct host" do
      FleetApp::ClientWrapper.new("production").client.host.should eq(FleetAppClient::HOST)
      FleetApp::ClientWrapper.new("staging").client.host.should eq(FleetAppClient::SANDBOX_HOST)
      FleetApp::ClientWrapper.new("sandbox").client.host.should eq(FleetAppClient::SANDBOX_HOST)
      FleetApp::ClientWrapper.new("test").client.host.should eq(FleetAppClient::DEVELOPMENT_HOST)
      FleetApp::ClientWrapper.new("development").client.host.should eq(FleetAppClient::DEVELOPMENT_HOST)
    end

    it "uses the Client passed in the constructor" do
      client = FleetApp::Client.new(FleetAppClient::SANDBOX_HOST)
      FleetApp::ClientWrapper.new("production", client).client.host.should eq(FleetAppClient::SANDBOX_HOST)
    end
  end
end
