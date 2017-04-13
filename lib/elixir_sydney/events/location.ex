defmodule ElixirSydney.Events.Location do
  use ElixirSydney, :model

  alias ElixirSydney.Events.Meetup

  schema "location" do
    field :name, :string
    field :map_url, :string

    has_many :meetups, Meetup
  end
end
