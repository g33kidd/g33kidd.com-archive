defmodule Blog.PostController do
  use Blog.Web, :controller

  plug :scrub_params, "post" when action in [:update, :create]
  plug Blog.Plugs.Authenticate

  alias Blog.Post

  # admin page...
  def index(conn, _) do
    posts = Post.all() |> Blog.PostSerializer.format(conn)
    json conn, posts
  end

  def show(conn, %{"id" => id}) do
    post = Post.get_by_id(id) |> Blog.PostSerializer.format()
    json conn, post
  end

  def create(conn, %{"post" => post}) do
    post = %{
      title: post["title"],
      body: post["body"],
      user_id: post["user_id"]
    }

    case Blog.Post.create(post) do
      {:ok, post} ->
        json conn, Blog.PostSerializer.format(post)
      {:error, errors} ->
        errors = errors |> Enum.into(%{})
        json conn, errors
    end
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    changeset = Post.get_by_id(id) |> Post.changeset(post_params)
    case Blog.Repo.update(changeset) do
      {:ok, post} -> json(conn, Blog.PostSerializer.format(post))
      {:error, changeset} -> json(conn, changeset.errors)
    end
  end

  def destroy(conn, %{"id" => id}) do
    post = Blog.Post.get_by_id(id) |> Blog.Repo.delete!
    json conn, %{ id: id }
  end
end
