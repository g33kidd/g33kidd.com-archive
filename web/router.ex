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

    get "/:type", AdminController, :content
    get "/:type/new", AdminController, :new_content
    get "/:type/edit/:id", AdminController, :edit_content
    
  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack

    get "/", BlogController, :index
    get "/:slug", BlogController, :show
  end
end
