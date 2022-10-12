require "json"
require "http/client"

class FleetAppClient
  VERSION      = "0.2.3"
  HOST         = "fleet.hostari.com"
  SANDBOX_HOST = "sandbox-#{HOST}"
end

require "./fleet_app/**"
