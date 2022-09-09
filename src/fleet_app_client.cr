require "json"
require "http/client"

class FleetAppClient
  VERSION      = "0.1.7"
  HOST         = "fleet.hostari.com"
  SANDBOX_HOST = "sandbox-#{HOST}"
end

require "./fleet_app/brooce_command/create.cr"
require "./fleet_app/api_path.cr"
require "./fleet_app/api_result.cr"
require "./fleet_app/client_wrapper.cr"
require "./fleet_app/client.cr"
require "./fleet_app/create.cr"
require "./fleet_app/delete.cr"
require "./fleet_app/error_result.cr"
require "./fleet_app/error.cr"
require "./fleet_app/game.cr"
require "./fleet_app/get_details.cr"
require "./fleet_app/get_game_id.cr"
require "./fleet_app/restart.cr"
require "./fleet_app/start.cr"
require "./fleet_app/stop.cr"
