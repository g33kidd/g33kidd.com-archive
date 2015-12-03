defmodule Blog.Repo.Migrations.CreateContent do
  use Ecto.Migration

  def change do
    create table(:content) do
      add :type, :string
      add :data, :map
      add :slug, :string

      timestamps
    end

    create unique_index(:content, [:slug])
  end
end
