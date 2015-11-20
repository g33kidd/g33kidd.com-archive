defmodule Blog.Endpoint do
  use Phoenix.Endpoint, otp_app: :blog

  socket "/socket", Blog.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  # Set gzip to true when deploying with phoenix.digest
  plug Plug.Static,
    at: "/", from: :blog, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # see :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_blog_key",
    signing_salt: "K5yEdur7"

  plug Blog.Router
end
