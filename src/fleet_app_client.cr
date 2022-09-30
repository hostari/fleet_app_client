require "json"
require "http/client"
require "uri/params"

class FleetAppClient
  VERSION      = "0.2.2"
  HOST         = "fleet.hostari.com"
  SANDBOX_HOST = "sandbox-#{HOST}"
end

require "./fleet_app/**"
