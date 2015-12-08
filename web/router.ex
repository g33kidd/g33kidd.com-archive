defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Blog.Plugs.AdminAuthentication
  end

  scope "/admin", Blog do
    pipe_through :admin

    get "/", AdminController, :index
    get "/posts", PostController, :index
    get "/posts/new", PostController, :new
    get "/posts/edit/:id", PostController, :edit
    put "/posts/:id", PostController, :update
    
    post "/posts", PostController, :create
    delete "/posts", PostController, :destroy

    get "/settings", AdminController, :settings
  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :home
    get "/:slug", PostController, :show
    get "/:slug", PageController, :show
  end
end
