Amber::Server.configure do |app|
  pipeline :web do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::CSRF.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :web do
    get "/", HomeController, :index
    get "/media", HomeController, :media
    get "/blog", BlogController, :index
    get "/blog/:year/:month/:day/:id", BlogController, :show

    # Redirect old guides to GitBook
    get "/docs/*", HomeController, :guides
    get "/guides/*", HomeController, :guides
    get "/amber/*path", HomeController, :amber
    get "/granite/*", HomeController, :granite
    get "/recipes/*", HomeController, :examples
    get "/getting-started/*", HomeController, :getting_started
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Amber::Controller::Static, :index
  end
end
