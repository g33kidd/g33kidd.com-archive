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
    post = Post.get_by_id(id)
    post = Blog.PostSerializer.format(post)
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
    post = Post.get_by_id(id)
    changeset = Post.changeset(post, post_params)
    case Blog.Repo.update(changeset) do
      {:ok, post} ->
        json conn, Blog.PostSerializer.format(post)
      {:error, changeset} ->
        json conn, changeset.errors
    end
  end

  def destroy(conn, %{"id" => id}) do
    IO.puts id
    post = Blog.Post.get_by_id(id)
    IO.inspect post
    Blog.Repo.delete!(post)
    json conn, %{ id: id }
  end

  # admin page...
  # def edit(conn, %{"id" => id}) do
  #   post = Post.changeset Post.get([id: id])
  #   conn
  #   |> put_layout("admin.html")
  #   |> render("edit.html", [post: post])
  # end
  #
  # # admin page...
  # def new(conn, _params) do
  #   user = get_session(conn, :current_user)
  #   post = Post.changeset %Post{}, %{}
  #
  #   conn
  #   |> put_layout("admin.html")
  #   |> render("new.html", [post: post])
  # end
  #
  # def update(conn, %{"post" => post_params}) do
  #   IO.inspect post_params
  #   conn |> halt
  # end
  #
  # def create(conn, %{"post" => post_params}) do
  #   changeset = Post.changeset %Post{}, post_params
  #   case Repo.insert changeset do
  #     {:ok, post} ->
  #       conn
  #       |> put_flash(:info, "Created post!")
  #       |> redirect(to: "/")
  #     {:error, changeset} ->
  #       conn
  #       |> assign(:changeset, changeset)
  #       |> redirect(to: "/")
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   post = Post.get(id)
  #   conn |> halt
  # end
end
