defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/admin", Blog do
    pipe_through :browser

    get "/", AdminController, :index
    get "/settings", AdminController, :settings

    get "/:type", ContentController, :index
    get "/:type/new", ContentController, :new
    get "/:type/edit/:id", ContentController, :edit

  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack

    get "/", BlogController, :index
    get "/:slug", BlogController, :show
  end
end
