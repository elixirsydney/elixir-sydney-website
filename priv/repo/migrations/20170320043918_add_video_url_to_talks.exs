defmodule ElixirSydney.Repo.Migrations.AddVideoUrlToTalks do
  use Ecto.Migration

  def change do
    alter table(:talk) do
      add :video_url, :string
      add :slide_url, :string
    end
  end
end
