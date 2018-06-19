require "amber"
require "markdown"
require "../src/controllers/application_controller"
require "../src/controllers/**"

Amber::Server.configure do |settings|
  settings.port = ENV["PORT"].to_i if ENV["PORT"]?
end
