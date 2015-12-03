defmodule Blog.BlogController do
  use Blog.Web, :controller

  alias Blog.Post
  alias Blog.Page

  def index(conn, _params) do
    render conn, "index.html",
      posts: Repo.all(Post)
  end

  @doc """
  Display the requested page based on its slug.
  TODO: display not found page if nothing is found
  """
  def show(conn, %{"slug" => slug}) do
    if Post.has_slug?(slug) do
      display_post conn, slug
    end

    if Page.has_slug?(slug) do
      display_page conn, slug
    end

    display_none conn
  end

  def display_page(conn, slug) do
    render conn, "page.html",
      page: Page.get_by_slug slug
  end

  def display_post(conn, slug) do
    render conn, "post.html",
      post: Post.get_by_slug slug
  end

  def display_none(conn) do
    conn |> render Blog.ErrorView, "404.html"
  end
end
