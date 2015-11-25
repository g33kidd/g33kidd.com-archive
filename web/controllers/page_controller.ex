defmodule Blog.PageController do
  use Blog.Web, :controller

  alias Blog.Post
  alias Blog.Page

  def index(conn, params) do
    IO.inspect params
    render conn, "index.html"
  end

  def show(conn, %{"slug" => slug}) do
    if has_post(slug) do
      display_post(conn, slug)
    end
    if has_page(slug) do
      display_page(conn, slug)
    end

    # TODO: redirect to error page
    conn |> redirect(to: "/")
  end

  def display_post(conn, slug) do
    post = Repo.get_by(Post, slug: slug)
    render conn, "post.html",
      post: post
  end

  def display_page(conn, slug) do
    page = Repo.get_by(Post, slug: slug)
    render conn, "page.html",
      page: page
  end

  def has_post(slug) do
    query = from p in Post,
          where: p.slug == ^slug,
          select: count(p.id)

    count = Repo.one(query)

    if count > 0 do
      true
    else
      false
    end
  end

  def has_page(slug) do
    query = from p in Page,
          where: p.slug == ^slug,
          select: count(p.id)

    count = Repo.one(query)

    if count > 0 do
      true
    else
      false
    end
  end
end
