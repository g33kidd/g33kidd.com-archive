defmodule Blog.PostController do
  use Blog.Web, :controller

  def index(conn, _) do
    render conn, "index.html",
      posts: Blog.Repo.all Blog.Post
  end

  def show(conn, %{"slug" => slug}) do
  end

end
