defmodule Blog.Post do
  use Blog.Web, :model

  require Logger
  alias Blog.Post

  schema "posts" do
    field :title, :string
    field :body, :string
    field :user_id, :integer
    field :slug, :string
    field :data, :map

    timestamps
  end

  @required_fields ~w(title body user_id)
  @optional_fields ~w(slug)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:slug)
  end

  # Adds different fields to a post entry
  def do_extensions(post) do
    html = post.body |> Earmark.to_html()

    short = html
      |> HtmlSanitizeEx.strip_tags()
      |> String.split()
      |> Enum.take(150)
      |> Enum.join(" ")

    basic = html |> HtmlSanitizeEx.basic_html()

    data = %{
      html: html,
      short_text: short,
      original: post.body,
      basic_html: basic
    }
    %{ post | data: data }
  end

  def create(post) do
    changeset = changeset(%Post{}, post)
    case Blog.Repo.insert changeset do
      {:ok, doc} -> {:ok, doc}
      {:error, changeset} -> {:error, changeset.errors}
    end
  end

  # gets all posts
  # and runs markdown, etc... on each post
  def all() do
    Blog.Repo.all(Post)
    |> Enum.map(fn(post) -> do_extensions(post) end)
  end

  # get post by `id`
  # def get([id: id]), do: Blog.Repo.get_by(Blog.Post, id: id)
  # def get!([id: id]), do: Blog.Repo.get_by!(Blog.Post, id: id)
  def get_by_slug(slug) do
    Blog.Repo.get_by(Post, slug: slug)
  end

  def get_by_id(id) do
    Blog.Repo.get_by(Post, id: id)
  end
end
