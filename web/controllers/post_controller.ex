defmodule Blog.PostController do
  use Blog.Web, :controller

  plug :scrub_params, "post" when action in [:update, :create]

  alias Blog.Post
  alias Blog.Repo

  # admin page...
  def index(conn, _) do
    conn
    |> put_layout("admin.html")
    |> render("index.html", [posts: Post.all])
  end

  def show(conn, %{"slug" => slug}) do
    post = Post.get(slug)
    post = Map.from_struct(post)
    # post = Enum.each(post, fn{k,v} -> {String.to_atom(k), v} end)

    html = Earmark.to_html(post.body)
    post = post |> Dict.put(:html, html)

    render conn, "show.html", post: post
  end

  # admin page...
  def edit(conn, %{"id" => id}) do
    post = Post.get(id)
    conn
    |> put_layout("admin.html")
    |> render("edit.html", [post: post])
  end

  # admin page...
  def new(conn, _params) do
    user = get_session(conn, :current_user)
    changeset = Post.changeset %Post{}, %{}

    conn
    |> put_layout("admin.html")
    |> render("new.html", [changeset: changeset])
  end

  def update(conn, %{"post" => post_params}) do
    IO.inspect post_params
    conn |> halt
  end

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
    post = Post.get(id)
    conn |> halt
  end
end
