defmodule Blog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :styles, :map
      add :slug, :string

      timestamps
    end

    create unique_index(:posts, [:slug])
  end
end
