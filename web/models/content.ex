defmodule Blog.Content do
  use Blog.Web, :model

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
  end

end
