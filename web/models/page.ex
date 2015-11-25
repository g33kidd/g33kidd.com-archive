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
    |> unique_constraint(:slug)
  end
end
