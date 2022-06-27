require "../../spec_helper"

describe FleetApp::Server::BrooceCommand do
  context "correct game name" do
    describe ".call" do
      it "returns an ApiResult" do
        server_id = "1234"
        root_path = "https://fleet.hostari.com"
        queue_name = "sample.host"

        WebMock.stub(:post, "#{root_path}/api/v1/valheim/servers/#{server_id}/brooce_command?queue_name=#{queue_name}")
          .with(headers: {"X-Auth-Token" => ""})
          .to_return(status: 200, body: File.read("spec/support/valheim/servers/brooce_command/create_success.json"))

        result = FleetApp::Server::BrooceCommand.create(queue_name, "valheim", server_id, "echo 'foobar'")

        result.should be_a(FleetApp::ApiResult)
      end
    end
  end
  context "wrong game name" do
    describe ".call" do
      it "returns an ErrorResult" do
        server_id = "1234"
        root_path = "https://fleet.hostari.com"
        game_name = "invalid-name"
        queue_name = "sample.host"

        result = FleetApp::Server::BrooceCommand.create(queue_name, game_name, server_id, "echo 'foobar'")

        result.should be_a(FleetApp::ErrorResult)
      end
      it "returns the correct error message" do
        server_id = "1234"
        root_path = "https://fleet.hostari.com"
        game_name = "invalid-name"
        queue_name = "sample.host"

        result = FleetApp::Server::BrooceCommand.create(queue_name, game_name, server_id, "echo 'foobar'")

        result.message.should eq("Game 'invalid-name' not supported.")
      end
    end
  end
end
