defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    field :url_slug, :string

    timestamps
  end

  @required_fields ~w(title body url_slug)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:url_slug)
  end
end
