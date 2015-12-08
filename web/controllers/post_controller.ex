defmodule Blog.PostController do
  use Blog.Web, :controller

  plug :scrub_params, "post" when action in [:update, :create]

  require Logger
  alias Blog.Post
  alias Blog.Repo

  def index(conn, _) do
    conn
    |> put_layout("admin.html")
    |> render("index.html", [posts: Post.all])
  end

  def show(conn, %{"slug" => slug}) do
    post = Post.get([slug: slug]) |> Post.do_extensions()
    render conn, "show.html", post: post
  end

  def edit(conn, %{"id" => id}) do
    post = Post.get([id: id])
    post = Post.changeset post
    conn
    |> put_layout("admin.html")
    |> render("edit.html", [post: post, action: post_path(conn, :update, id)])
  end

  def new(conn, _params) do
    user = get_session(conn, :current_user)
    post = Post.changeset %Post{}, %{}

    conn
    |> put_layout("admin.html")
    |> render("new.html", [post: post, action: post_path(conn, :create)])
  end

  # TODO: improve error handling
  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Post.get id: id
    changeset = Post.changeset(post, post_params)
    case Repo.update(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post saved!")
        |> redirect(to: post_path(conn, :edit, post.id))
      {:error, changeset} ->
        conn |> put_flash(:info, "Could not save post!")
        Logger.info("Could not save post! #{inspect changeset}")
    end

    conn |> redirect(to: post_path(conn, :index))
  end

  # TODO: improve error handling
  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset %Post{}, post_params
    case Repo.insert changeset do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Created post!")
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        conn
        |> assign(:changeset, changeset)
        |> redirect(to: post_path(conn, :new))
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Post.get id: id
    Repo.delete! post

    conn
    |> put_flash(:info, "Post deleted successfully!")
    |> redirect(to: post_path(conn, :index))
  end
end
