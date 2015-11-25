defmodule Blog.Plugs.AdminPlug do
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, default) do
    conn
    |> put_layout("admin.html")
  end
end
