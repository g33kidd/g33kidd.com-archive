defmodule Blog.AdminController do
  use Blog.Web, :controller

  plug :admin_assigns

  def index(conn, _) do
    put_layout conn, "admin.html"
    render conn, "index.html"
  end

  def pages(conn, _) do
    put_layout conn, "admin.html"
    render conn, "pages.html",
      pages: Blog.Content.get_all_by("page")
  end

  def posts(conn, _) do
    put_layout conn, "admin.html"
    render conn, "posts.html",
      posts: Blog.Content.get_all_by("post")
  end

  # TODO: get the current settings and assing them
  def settings(conn, _) do
    put_layout conn, "admin.html"
    render conn, "settings.html"
  end

  # returns a list of assigns
  defp get_admin_assigns do
    [ most_recent: Blog.Content.get_last(5) ]
  end

  defp admin_assigns(conn, _) do
    Enum.map get_admin_assigns, fn {k, v} -> assign(conn, :"#{k}", v) end
  end

end
