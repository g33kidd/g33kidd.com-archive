defmodule Blog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :user_id, :integer
      add :slug, :string
      add :data, :map

      timestamps
    end

    create unique_index(:posts, [:slug])
  end
end
