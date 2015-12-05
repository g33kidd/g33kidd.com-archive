defmodule Blog.Repo.Migrations.CreateExtra do
  use Ecto.Migration

  def change do
    create table(:extras) do
      add :name, :string
      add :text, :text
      add :map, :map
      add :type, :string

      timestamps
    end

  end
end
