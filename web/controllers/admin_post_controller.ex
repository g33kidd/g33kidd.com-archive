defmodule Blog.AdminPostController do
  use Blog.Web, :controller
  alias Blog.Post

  plug :scrub_params, "post" when action in [:create]
  plug :use_admin_layout

  def index(conn, _) do
    render conn, "index.html",
      posts: Repo.all(Post)
  end

  def edit(conn, _) do
  end

  def new(conn, _) do
    changeset = Post.changeset(%Post{}, %{
      title: "Title",
      body: "Body"
    })

    render conn, "new.html",
      changeset: changeset,
      action: admin_post_path(conn, :create)
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)
    case Repo.insert(Post, changeset) do
      {:ok, doc} ->
        conn |> put_flash(:info, "Created post!") |> halt
      {:error, changeset} ->
        conn |> put_flash(:error, "Could not create post!") |> halt
    end
  end

  def use_admin_layout(conn, _) do
    conn |> put_layout("admin.html")
  end
end
