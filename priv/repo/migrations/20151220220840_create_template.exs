defmodule Blog.Repo.Migrations.CreateTemplate do
  use Ecto.Migration

  def change do
    create table(:templates) do
      add :name, :string
      add :content, :text

      timestamps
    end

  end
end
