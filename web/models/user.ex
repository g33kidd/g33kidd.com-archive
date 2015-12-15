defmodule Blog.User do
  use Blog.Web, :model
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  alias Blog.User
  alias Blog.Repo

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
    # |> unique_constraint([:username], on: User, downcase: true)
    # |> unique_constraint([:email], on: User, downcase: true)
    |> validate_confirmation(:password, message: "passwords do not match")
    |> hash_password()
  end

  def hash_password(changeset) do
    if password = get_change(changeset, :password) do
      put_change(changeset, :password_hash, hashpwsalt(password))
    else
      changeset
    end
  end

  def get_by(id) do
    query = from u in User,
          where: u.id == ^id
    Repo.one! query
  end

  def find_by_username(username) do
    query = from u in User,
          where: u.username == ^username
    Repo.one! query
  end

end
