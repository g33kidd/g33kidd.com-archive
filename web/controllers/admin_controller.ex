defmodule Blog.AdminController do
  use Blog.Web, :controller

  def index(conn, _) do
    put_layout conn, "admin.html"
    render conn, "index.html",
      get_admin_assigns
  end

  def pages(conn, _) do
    put_layout conn, "admin.html"
    render conn, "pages.html",
      get_admin_assigns,
      pages: Blog.Page.get_all
  end

  def posts(conn, _) do
    put_layout conn, "admin.html"
    render conn, "posts.html",
      get_admin_assigns,
      posts: Blog.Post.get_all
  end

  # TODO: get the current settings and assing them
  def settings(conn, _) do
    put_layout conn, "admin.html"
    render conn, "settings.html",
      get_admin_assigns
  end

  # returns a list of assigns
  defp get_admin_assigns do
    [
      last_five_posts: Blog.Post.get_last(5)
    ]
  end

end
