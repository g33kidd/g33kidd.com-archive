defmodule Blog.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    {:ok, socket}
  end
end
