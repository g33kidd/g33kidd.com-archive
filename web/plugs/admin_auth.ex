defmodule Blog.Plugs.AdminAuthentication do
  import Phoenix.Controller
  import Plug.Conn

  def init(default), do: default

  def call(conn, _) do
    conn
    # case Blog.User.validate(user, token) do
    #   {:ok, _user} -> conn
    #   _ ->
    #     conn
    #     |> put_flash(:error, "You must be logged in to view this page.")
    #     |> redirect(to: "/")
    # end
  end

end
