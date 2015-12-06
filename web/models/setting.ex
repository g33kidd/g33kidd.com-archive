defmodule Blog.Setting do
  use Blog.Web, :model

  alias Blog.Setting
  alias Blog.Repo

  schema "settings" do
    field :key, :string
    field :val, :string
    field :map, :map

    timestamps
  end

  @required_fields ~w(key val)
  @optional_fields ~w(map)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model |> cast(params, @required_fields, @optional_fields)
  end

  def create(key, val) when is_map(val) do
    setting = Setting.changeset Setting, %{name: key, map: val}
    Repo.insert setting
  end

  def create(key, val) when is_bitstring(val) do
    setting = Setting.changeset Setting, %{name: key, text: val}
    Repo.insert setting
  end

  # gets a setting by it's key. Returns a `val` or a `map`.
  def get(key) do
    setting = Repo.get_by! Setting, name: key
    Dict.get_lazy(setting, :val, fn -> :map end)
  end

  @doc """

    Will return a Map of all the settings:
    %{key: val}

    If `val` does not exist, we'll add `map` to the final Map.

  """
  def get_all(except \\ [], only \\ []) do
  end
end
