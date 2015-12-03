defmodule Blog.Content do
  use Blog.Web, :model

  alias Blog.Repo

  schema "content" do
    field :type, :string
    field :data, :map
    field :slug, :string

    timestamps
  end

  @required_fields ~w(type data)
  @optional_fields ~w(slug)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    # |> unique_constraint(:slug, on: Blog.Repo, downcase: true)
  end

  def get_all do
    Repo.all Blog.Content
  end

  def get_all_by(type) do
    query = from c in Blog.Content,
      where: c.type == ^type

    Repo.all query
  end

  def get_all_clean(type) do
    all = get_all_by(type)
    for item <- all, do: do_add_map_vals(item)
  end

  def do_add_map_vals(content) do
    IO.inspect content
    map = Map.from_struct(content)

    Map.new()
    |> Dict.merge(map.data)
    |> Dict.put(:slug, map.slug)
    |> Dict.put(:id, map.id)
    |> to_atom()
  end

  def get_single(slug) when is_bitstring(slug) do
    Repo.get_by! Blog.Content, slug: slug
  end

  def get_single(id) when is_number(id) do
    Repo.get! id
  end

  def to_atom(content) do
    for {key, val} <- content, into: %{}, do: {:"#{key}", val}
  end

  def get_data_for(content) do
    to_atom(content.data)
  end

  # gets the last 'n' posts
  def get_last(n \\ 10) do
    (from p in Blog.Content, limit: ^n) |> Repo.all
  end

  def has_slug?(slug) do
    query = from c in Blog.Content,
      where: c.slug == ^slug,
      select: count(c.id)

    Repo.one! query
  end

end
