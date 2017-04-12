defmodule ElixirSydney.Repo.Migrations.AddSlugToTalks do
  use Ecto.Migration

  def change do
    alter table(:talk) do
      add :slug, :string, null: false
    end

    create unique_index(:talk, :slug)
  end
end
