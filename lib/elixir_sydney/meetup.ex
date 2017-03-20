defmodule ElixirSydney.Meetup do
  use ElixirSydney, :model

  alias ElixirSydney.{Meetup, Talk, Person, Location}

  schema "meetup" do
    field :title, :string
    field :slug, :string
    field :description, :string
    field :url, :string
    field :date, Timex.Ecto.Date

    belongs_to :location, ElixirSydney.Location
    has_many :talks, ElixirSydney.Talk
  end

  def next_meetup do
    # hd all()
  end

  def past_meetups do
    # tl all()
  end
end
