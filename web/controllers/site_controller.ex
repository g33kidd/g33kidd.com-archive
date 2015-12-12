defmodule Blog.SiteController do
  use Blog.Web, :controller

  def index(conn, _) do
    render conn, "index.html",
      posts: Blog.Post.all
  end

  def display(conn, %{"slug" => slug}) do
    if post = Blog.Post.get_by_slug(slug) do
      show_post(conn, post)
    else
      conn |> halt
    end
  end

  def show_post(conn, post) do
    post = Blog.Post.do_extensions(post)
    render conn, "post.html", post: post
  end
end
