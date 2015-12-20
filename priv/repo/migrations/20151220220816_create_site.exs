defmodule Blog.Repo.Migrations.CreateSite do
  use Ecto.Migration

  def change do
    create table(:site) do
      add :title, :string
      add :description, :string
      add :use_custom_css, :boolean
      add :use_google_analytics, :boolean
      add :custom_css, :text
      add :ga_tracking_code, :string

      timestamps
    end

  end
end
