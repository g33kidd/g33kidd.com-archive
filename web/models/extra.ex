defmodule Blog.Extra do
  use Blog.Web, :model

  schema "extras" do
    field :name, :string
    field :text, :string
    field :map, :map
    field :type, :string

    timestamps
  end

  @required_fields ~w(name text map type)
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
end
