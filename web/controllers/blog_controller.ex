defmodule Blog.BlogController do
  use Blog.Web, :controller

  alias Blog.Content

  def index(conn, _params) do
    posts = Content.get_all_clean("post")
    render conn, "index.html",
      posts: posts
  end

  @doc """
  Display the requested page based on its slug.
  TODO: display not found page if nothing is found
  """
  def show(conn, %{"slug" => slug}) do
    if Content.has_slug?(slug) do
      display_content conn, slug
    end

    display_none conn
  end

  def display_content(conn, slug) do
    content = Content.get_single(slug)
    |> Map.from_struct()
    |> Content.to_atom()
    |> Blog.ContentExt.parse()

    content_assigns = []
    |> Dict.put(content.type, Content.get_data_for(content))
    |> Dict.put(:slug, content.slug)

    put_layout(conn, "blank.html")
    render conn, "#{content.type}.html", content_assigns
  end

  def display_none(conn) do
    conn |> render Blog.ErrorView, "404.html"
  end
end
