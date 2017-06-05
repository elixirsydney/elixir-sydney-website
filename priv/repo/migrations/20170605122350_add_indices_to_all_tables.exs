defmodule ElixirSydney.Repo.Migrations.AddIndicesToAllTables do
  use Ecto.Migration

  def change do
    create unique_index(:meetup, :slug)
    create unique_index(:meetup, :date)
    create unique_index(:location, :name)
    create unique_index(:person, :name)

    alter table(:location) do
      add :address, :string, null: false
      add :suburb, :string, null: false, default: "Sydney"
      add :postcode, :string, null: false, default: "2000"
      add :state, :string, null: false, default: "NSW"
      add :country, :string, null: false, default: "Australia"
      add :instructions, :string
    end
  end
end
