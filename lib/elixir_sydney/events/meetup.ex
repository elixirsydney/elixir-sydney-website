defmodule ElixirSydney.Events.Meetup do
  use Ecto.Schema

  import Ecto.Changeset
  alias ElixirSydney.Repo
  alias ElixirSydney.Events.{Meetup, Talk, Location}

  schema "meetup" do
    field :title, :string
    field :slug, :string
    field :description, :string
    field :url, :string
    field :date, Timex.Ecto.Date

    belongs_to :location, Location
    has_many :talks, Talk
  end

  def changeset(%Meetup{} = meetup, attrs) do
    changeset =
      meetup
      |> Repo.preload([:location, :talks])
      |> cast(attrs, [:title, :slug, :description, :url, :date])
      |> cast_assoc(:talks)

    changeset =
      case Map.get(attrs, :location) do
        nil -> cast_assoc(changeset, :location, required: true)
        location -> put_assoc(changeset, :location, location)
      end

    validate_required(changeset, [:title, :slug, :description, :url, :date])
  end
end
