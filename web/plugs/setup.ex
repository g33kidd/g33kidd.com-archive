defmodule Blog.Plugs.Setup do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _) do
    # 1. check if the site has been setup, via the settings
    # setting :setup, boolean, default: false
    # 2. redirect the user to /setup or /install
    # 3. user fills out form for default admin and site settings
    # 4. create default templates, styles, etc...
    conn
  end
end
