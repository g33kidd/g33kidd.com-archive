defmodule Blog.PostController do
  use Blog.Web, :controller

  plug :scrub_params, "post" when action in [:update, :create]

  alias Blog.Post
  alias Blog.Repo

  # admin page...
  def index(conn, _) do
    posts = Post.all() |> Blog.PostSerializer.format(conn)
    json conn, posts
  end

  def show(conn, %{"id" => id}) do
    post = Post.get([id: id]) |> Blog.PostSerializer.format(conn)
    json conn, post
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
