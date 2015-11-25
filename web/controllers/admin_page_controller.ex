defmodule Blog.AdminPageController do
  use Blog.Web, :controller
  alias Blog.Page

  plug :scrub_params, "page" when action in [:create]

  def index(conn, _) do
    render conn, "index.html"
  end

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"page" => page_params}) do
  end

  def edit(conn, _) do
  end

  def update(conn, _) do
  end

end
