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
    meetup
    |> Repo.preload([:location, :talks])
    |> cast(attrs, [:title, :slug, :description, :url, :date])
    |> cast_assoc(:location, required: true)
    |> cast_assoc(:talks)
    |> validate_required([:title, :slug, :description, :url, :date])
  end
end
