defmodule Blog.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :profiles, :map
      add :admin, :boolean, default: false

      timestamps
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end
