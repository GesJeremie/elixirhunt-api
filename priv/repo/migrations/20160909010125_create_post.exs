defmodule Elixirhunt.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :company, :string
      add :location, :string
      add :content, :string
      add :logo, :string
      add :url, :string

      timestamps
    end

  end
end
