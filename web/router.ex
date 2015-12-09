defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", Blog do
    pipe_through :browser
    get "/*anything", AdminController, :index
  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :home
    get "/:slug", PostController, :show
    get "/:slug", PageController, :show
  end

  # API -----------------------
  scope "/api", Blog do
    pipe_through :api

    # add some resources here..
  end
end
