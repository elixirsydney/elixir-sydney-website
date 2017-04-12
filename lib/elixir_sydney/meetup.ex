defmodule ElixirSydney.Meetup do
  use ElixirSydney, :model

  alias ElixirSydney.{Meetup, Talk, Person, Repo, Location}

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
    Meetup
    # |> where([m], m.date > ^Date.utc_today)
    |> order_by(asc: :date)
    |> last
    |> preload(:location)
    |> preload(talks: :presenter)
    |> Repo.one!
  end

  def past_meetups do
    # tl all()
  end
end
