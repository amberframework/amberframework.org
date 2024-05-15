module ApplicationHelper
  LAYOUT = "application.slang"
  @title = "Amber - Crystal Web Application Framework"
  @container_class = "container"
  @meta = "Amber aims to deliver developer happiness, productivity and bare metal performance"
  @development : Bool? = Amber.env.development?

  # vMajor.minor.path - mm/dd/yyyy (v1.4.1 - 11/8/2022)
  @latest_amber_version = "v1.4.1"
  @latest_amber_release_date = "8/2/2023"

  @amber_count_of_releases = "50"
  @amber_count_of_stargazers = "2500"
  @amber_count_of_commits = "1200"
end
