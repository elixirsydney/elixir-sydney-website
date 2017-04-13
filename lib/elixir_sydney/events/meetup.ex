defmodule ElixirSydney.Events.Meetup do
  use Ecto.Schema

  alias ElixirSydney.Events.{Talk, Location}

  schema "meetup" do
    field :title, :string
    field :slug, :string
    field :description, :string
    field :url, :string
    field :date, Timex.Ecto.Date

    belongs_to :location, Location
    has_many :talks, Talk
  end

end
