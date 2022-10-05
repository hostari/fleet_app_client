require "json"
require "http/client"

class FleetAppClient
  VERSION          = "0.2.2"
  HOST             = "fleet.hostari.com"
  SANDBOX_HOST     = "sandbox-#{HOST}"
  DEVELOPMENT_HOST = "localhost:2450"
end

require "./fleet_app/**"
