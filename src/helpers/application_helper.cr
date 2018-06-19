module ApplicationHelper
  LAYOUT = "application.slang"
  @title = "Amber - Crystal Web Application Framework"
  @container_class = "container"
  @meta = "Amber aims to deliver developer happiness, productivity and bare metal performance"
  @development : Bool? = Amber.env.development?
end
