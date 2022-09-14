require "amber"
require "markd"
require "../src/controllers/application_controller"
require "../src/controllers/**"

Amber::Server.configure do |settings|
  settings.port = ENV["AMBER_PORT"]? ? ENV["AMBER_PORT"].to_i : Int32.new(3000)
end
