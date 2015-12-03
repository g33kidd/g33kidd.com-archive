defmodule Blog.AdminController do
  use Blog.Web, :controller

  plug :use_admin_layout
  plug :assign_admin_assigns

  def index(conn, _) do
    render conn, "index.html"
  end

  def pages(conn, _) do
    pages = Blog.Content.get_all_by("page")
    render conn, "pages.html", pages: pages
  end

  def posts(conn, _) do
    render conn, "posts.html",
      posts: Blog.Content.get_all_by("post")
  end

  # TODO: get the current settings and assing them
  def settings(conn, _) do
    render conn, "settings.html"
  end

  # returns a list of assigns
  defp get_admin_assigns do
    [ most_recent: Blog.Content.get_last(5) ]
  end

  defp assign_admin_assigns(conn, _) do
    admin_assigns = get_admin_assigns
    for {key, val} <- admin_assigns, do: assign(conn, :"#{key}", val)
    conn
  end

  defp use_admin_layout(conn, _) do
    conn |> put_layout("admin.html")
  end

end
