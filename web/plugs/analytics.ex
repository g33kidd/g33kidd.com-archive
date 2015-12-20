defmodule Blog.Plugs.Analytics do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _) do
    assign(conn, :analytics_code, "<script>// analytics code here</script>")
  end
end
