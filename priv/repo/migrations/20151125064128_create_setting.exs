defmodule Blog.Repo.Migrations.CreateSetting do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :name, :string
      add :text, :text
      add :map, :map

      timestamps
    end

  end
end
