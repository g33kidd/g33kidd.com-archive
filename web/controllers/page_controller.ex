defmodule Blog.PageController do
  use Blog.Web, :controller

  def index(conn, _) do
    conn
    |> put_layout("admin.html")
    |> render(Blog.AdminView, "index.html")
  end

  def home(conn, _) do
    render conn, "home.html",
      posts: Blog.Post.all
  end
end
