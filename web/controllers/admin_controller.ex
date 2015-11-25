defmodule Blog.AdminController do
  use Blog.Web, :controller

  plug :use_admin_layout

  def index(conn, _) do
    render conn, "index.html"
  end

  def settings(conn, _) do
    render conn, "settings.html"
  end

  def use_admin_layout(conn, _) do
    conn |> put_layout("admin.html")
  end
end
