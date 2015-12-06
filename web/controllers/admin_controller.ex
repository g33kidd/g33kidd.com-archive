defmodule Blog.AdminController do
  use Blog.Web, :controller

  plug :use_admin_layout
  plug :assign_admin_assigns

  def index(conn, _) do
    render conn, "index.html"
  end

  def content(conn, %{"type" => type}) do
    content = Blog.Content.all(type)
    render conn, "#{type}.html"
  end

  def new_content(conn, %{"type" => type}) do
    Blog.Content.create %{
      type: type,
      data: %{}
    }
  end

  def edit_content(conn, %{"type" => type, "id" => id}) do
  end

  # TODO: get the current settings and assign them
  # ========= !!!!
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
