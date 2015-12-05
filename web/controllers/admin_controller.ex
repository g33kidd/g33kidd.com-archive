defmodule Blog.AdminController do
  use Blog.Web, :controller

  plug :use_admin_layout
  plug :assign_admin_assigns

  def index(conn, _) do
    render conn, "index.html"
  end

  def content(conn, %{"type" => type}) do
    type = :"#{type}"
    content = Blog.Content.all(type)
    render conn, "#{type}", [
      {:"#{type}", content}
      # extras would go here..
    ]
  end

  def new_content(conn, %{"type" => type}) do
    Blog.Content.create %{
      type: String.to_atom(type),
      data: %{}
    }
  end

  def edit_content(conn, %{"type" => type, "id" => id}) do
  end

  # def pages(conn, _) do
  #   pages = Blog.Content.all(:page)
  #   render conn, "pages.html", pages: pages
  # end
  #
  # def posts(conn, _) do
  #   render conn, "posts.html",
  #     posts: Blog.Content.all(:post)
  # end

  # TODO: get the current settings and assing them
  def settings(conn, _) do
    render conn, "settings.html"
  end

  # returns a list of assigns
  defp get_admin_assigns do
    [ most_recent: Blog.Content.get_last(5) ]
  end

  defp assign_admin_assigns(conn, _) do
    for {key, val} <- get_admin_assigns, do: assign(conn, :"#{key}", val)
    conn
  end

  defp use_admin_layout(conn, _) do
    conn |> put_layout("admin.html")
  end

end
