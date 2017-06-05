defmodule ElixirSydney.Events.Location do
  use ElixirSydney, :model

  alias ElixirSydney.Events.{Location, Meetup}

  schema "location" do
    field :name, :string
    field :map_url, :string

    has_many :meetups, Meetup
  end

  def changeset(%Location{} = location, attrs) do
    location
    |> cast(attrs, [:name, :map_url])
    |> validate_required([:name, :map_url])
  end
end
