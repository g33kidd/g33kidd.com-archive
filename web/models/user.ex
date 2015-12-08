defmodule Blog.User do
  use Blog.Web, :model

  alias Blog.User

  schema "users" do
    field :username, :string
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :profiles, :map
    field :admin, :boolean, default: false
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps
  end

  @required_fields ~w(username name email password password_confirmation profiles admin)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint([:username, :email], on: Blog.User, downcase: true)
    |> validate_confirmation(:password, message: "passwords do not match")
  end

  def get_by(id) do
    query = from u in User,
          where: u.id == ^id
    Repo.one! query
  end

  # Token Validation
  #
  # def validate(%{"id" => id}, token) do
  #   user = get_by(id)
  #
  #   if user.token === token do
  #     {:ok, user}
  #   end
  # end
  #
  # def validate(_, token), do: {:error, "Not a valid token!"}

end
