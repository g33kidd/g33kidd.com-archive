defmodule Blog.SiteController do
  use Blog.Web, :controller

  plug Blog.Plugs.SiteAssigns

  def index(conn, params) do
    render conn, "index.html",
      posts: Blog.Post.all
  end

  def display(conn, %{"slug" => slug}), do: show_post(conn, [slug: slug])
  def display(conn, %{"post_id" => id}), do: show_post(conn, [id: id])

  def show_post(conn, [id: id]) do
    if post = Blog.Post.get_by_id(id) do
      post = Blog.Post.do_extensions(post)
      render conn, "post.html", post: post
    else
      conn |> redirect(to: "/not-found")
    end
  end

  def show_post(conn, [slug: slug]) do
    if post = Blog.Post.get_by_slug(slug) do
      post = Blog.Post.do_extensions(post)
      render conn, "post.html", post: post
    else
      conn |> redirect(to: "/not-found")
    end
  end

  def not_found(conn, _) do
    render conn, "404.html",
      posts: Blog.Post.all
  end
end
