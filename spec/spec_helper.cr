require "spec"
require "webmock"
Spec.before_each &->WebMock.reset
require "../src/fleet_app_client"
