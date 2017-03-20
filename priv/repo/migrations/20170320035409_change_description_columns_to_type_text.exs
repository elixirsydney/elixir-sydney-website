defmodule ElixirSydney.Repo.Migrations.ChangeDescriptionColumnsToTypeText do
  use Ecto.Migration

  def change do
    alter table(:meetup) do
      modify :description, :text
    end

    alter table(:talk) do
      modify :description, :text
    end
  end
end
