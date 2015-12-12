defmodule Blog.SiteController do
  use Blog.Web, :controller

  def index(conn, _) do
    render conn, "index.html",
      posts: Blog.Post.all
  end

  def display(conn, %{"slug" => slug}) do
    if post = Blog.Post.get([slug: slug]) do
      show_post(conn, post)
    else
      conn |> halt
    end
  end

  # TODO: when pages are added
  # def show_page(conn, slug) do
  # end

  def show_post(conn, slug) do
    post = Blog.Post.get [slug: slug] |> Post.do_extensions()
    render conn, "post.html", post: post
  end
end
