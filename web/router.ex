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

    get "/", AdminController, :index
    get "/settings", AdminController, :settings
    post "/settings", SettingsController, :update

    get "/login", SessionController, :new
    delete "/logout", SessionController, :destroy

    resources "/posts", AdminPostController
  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:slug", PageController, :show
  end
end
