defmodule Blog.Repo.Migrations.CreateSetting do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :key, :string
      add :val, :string
      add :map, :map

      timestamps
    end

  end
end
