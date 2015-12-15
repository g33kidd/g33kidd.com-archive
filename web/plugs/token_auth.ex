defmodule Blog.Plugs.Authenticate do
  import Phoenix.Controller
  import Plug.Conn
  import Joken

  def init(default), do: default

  def call(conn, _) do
    if token_header = conn.req_headers["authorization"] do
      verified_token = token_header
        |> token
        |> with_signer(hs256("secretstuff"))
        |> verify

      conn
    else
      conn |> halt
    end
  end

  def get_token(conn) do
    conn.req_headers["authorization"]
  end

end
