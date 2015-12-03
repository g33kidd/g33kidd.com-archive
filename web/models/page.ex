defmodule Blog.Page do
  use Blog.Web, :model

  schema "pages" do
    field :title, :string
    field :content, :string
    field :styles, :map
    field :html, :string
    field :slug, :string

    timestamps
  end

  @required_fields ~w(title content styles html slug)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:slug, on: Blog.Repo, downcase: true)
  end

  def has_slug?(slug) do
    (from p in Blog.Post, where: p.slug == ^slug, select: count(p.id))
    |> Repo.one!
  end

  # gets the last 'n' posts
  def get_last(n \\ 10) do
    (from p in Blog.Post, limit: ^n) |> Repo.all
  end

  def get_all do
    Blog.Post |> Repo.all
  end

  def get_by_slug(slug) do
    query = from p in Blog.Page,
          where: p.slug == ^slug,
          limit: ^1

    Repo.one(query) |> IO.inspect
  end

  def get_post_url(post) do
  end

end
