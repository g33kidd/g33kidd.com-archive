defmodule Blog.ContentController do
  use Blog.Web, :controller

  # TODO: plug to auth user
  plug :scrub_params, "content" when action in [:create, :update]

  def index(conn, %{"type" => type}) do
    content = Blog.Content.all(type)
    render conn, Blog.AdminView, "content.html",
      content: Blog.Content.all(type)
  end

  def new(conn, _) do
  end

  def create(conn, %{"content" => params}) do
  end

  def edit(conn, %{"id" => id}) do
  end

  def update(conn, %{"content" => params}) do
  end

  def delete(conn, %{"id" => id}) do
  end

end
