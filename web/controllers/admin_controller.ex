defmodule Blog.AdminController do
  use Blog.Web, :controller

  def index(conn, _) do
    conn
    |> put_layout("admin.html")
    |> render("index.html")
  end
end
