require "amber"
require "markd"
require "../src/controllers/application_controller"
require "../src/controllers/**"

Amber::Server.configure do |settings|
  settings.port = ENV["AMBER_PORT"]? ? ENV["AMBER_PORT"].to_i : Int32.new(Amber.settings.port)
  settings.host = ENV["AMBER_HOST"]? ? ENV["AMBER_HOST"] : Amber.settings.host
end
