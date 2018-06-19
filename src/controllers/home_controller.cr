class HomeController < ApplicationController
  def index
    render("index.slang")
  end

  def media
    render("media.slang")
  end

  def guides
    redirect_to location: "https://docs.amberframework.org/amber", status: 302
  end

  def getting_started
    redirect_to location: "https://docs.amberframework.org/amber/getting-started", status: 302
  end

  def examples
    redirect_to location: "https://docs.amberframework.org/amber/examples", status: 302
  end

  def amber
    path = params["path"]
    redirect_to location: "https://docs.amberframework.org/amber/#{path}", status: 302
  end

  def granite
    redirect_to location: "https://docs.amberframework.org/granite", status: 302
  end
end
