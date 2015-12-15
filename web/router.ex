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

    get "/", SiteController, :index
    get "/not-found", SiteController, :not_found
    get "/p/:post_id", SiteController, :display
    get "/:slug", SiteController, :display
  end

  # API -----------------------
  scope "/api", Blog do
    pipe_through :api

    post "/auth", AuthController, :login

    post "/posts", PostController, :create
    get "/posts", PostController, :index
    get "/posts/:id", PostController, :show
    put "/posts/:id", PostController, :update
    delete "/posts/:id", PostController, :destroy
  end
end
