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

    get "/*anything", AdminController, :index
  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :home
    # get "/:slug", PostController, :show
    # get "/:slug", PageController, :show
  end

  # defp put_user_token(conn, _) do
  #   if current_user = conn.assigns[:current_user] do
  #     token = Phoenix.Token.sign(conn, "user socket", current_user.id)
  #     assign(conn, :user_token, token)
  #   else
  #     conn
  #   end
  # end
end
