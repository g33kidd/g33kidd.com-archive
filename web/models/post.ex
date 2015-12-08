defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    field :user_id, :integer
    field :slug, :string

    timestamps
  end

  @required_fields ~w(title body user_id slug)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def all() do
    Blog.Repo.all Blog.Post
  end

  def get(id) when is_number(id) do
    Blog.Repo.get_by! Blog.Post, id: id
  end

  def get(slug) when is_bitstring(slug) do
    Blog.Repo.get_by! Blog.Post, slug: slug
  end
end
