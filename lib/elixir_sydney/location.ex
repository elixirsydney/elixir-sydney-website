defmodule ElixirSydney.Location do
  use ElixirSydney, :model

  schema "location" do
    field :name, :string
    field :map_url, :string

    has_many :meetups, ElixirSydney.Meetup
  end
end
