defmodule ElixirSydney.Repo.Migrations.InitialDbSchema do
  use Ecto.Migration

  def change do
    create table(:person) do
      add :name, :string, null: false
      add :avatar_url, :string, null: true
      add :meetup_url, :string, null: true
      add :website_url, :string, null: true
      add :twitter, :string, null: true
    end

    create table(:location) do
      add :name, :string, null: false
      add :map_url, :string, null: false
    end

    create table(:meetup) do
      add :title, :string, null: false
      add :slug, :string, null: false
      add :description, :string, null: false
      add :url, :string, null: false
      add :date, :date, null: false

      add :location_id, references(:location), null: false
    end

    create table(:talk) do
      add :title, :string, null: false
      add :description, :string, null: false

      add :presenter_id, references(:person), null: false
      add :meetup_id, references(:meetup), null: false
    end
  end
end
