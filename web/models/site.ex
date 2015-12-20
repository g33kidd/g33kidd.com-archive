defmodule Blog.Site do
  use Blog.Web, :model

  schema "site" do
    field :title, :string
    field :description, :string
    field :use_custom_css, :boolean, default: :false
    field :use_google_analytics, :boolean, default: :false
    field :custom_css, :string
    field :ga_tracking_code, :string

    timestamps
  end

  @required_fields ~w(title description)
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
