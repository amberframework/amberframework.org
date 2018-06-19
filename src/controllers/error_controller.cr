class Amber::Controller::Error < Amber::Controller::Base
  include ApplicationHelper

  def not_found
    render("404.slang")
  end

  def internal_server_error
    render("500.slang")
  end
end
