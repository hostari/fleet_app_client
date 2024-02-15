require "json"
require "http/client"

class FleetAppClient
  VERSION          = "1.0.0"
  HOST             = "fleet.hostari.com"
  SANDBOX_HOST     = "sandbox-#{HOST}"
  DEVELOPMENT_HOST = "localhost:2450"
end

require "./fleet_app/**"
