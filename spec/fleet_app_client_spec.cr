require "./spec_helper"

describe FleetApp::Client do
  it "returns a JSON object containing server information" do
    server_id = "1234"
    host = "2013197.xyz"
    WebMock.stub(:get, "https://#{host}/api/v1/core_keeper/servers/#{server_id}").to_return(status: 200, body: File.read("spec/support/servers/#{server_id}.json"))
    client = FleetApp::Client.new("2013197.xyz")
    response = client.get("/api/v1/core_keeper/servers/#{server_id}")
    server = response.body
    server.should eq(File.read("spec/support/servers/#{server_id}.json"))
  end
end
