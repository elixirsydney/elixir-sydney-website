defmodule ElixirSydney.Events.Location do
  use ElixirSydney, :model

  alias ElixirSydney.Events.{Location, Meetup}

  schema "location" do
    field :name, :string
    field :address, :string
    field :suburb, :string
    field :postcode, :string
    field :state, :string
    field :country, :string
    field :map_url, :string

    has_many :meetups, Meetup
  end

  def changeset(%Location{} = location, attrs) do
    location
    |> cast(attrs, [:name, :address, :suburb, :postcode, :state, :country, :map_url])
    |> validate_required([:name, :address, :map_url])
  end
end
