defmodule ElixirSydney.Events.Talk do
  use ElixirSydney, :model

  alias ElixirSydney.Events.{Person, Meetup, Talk}

  schema "talk" do
    field :title, :string
    field :slug, :string
    field :description, :string
    field :slide_url, :string
    field :video_url, :string

    belongs_to :presenter, Person
    belongs_to :meetup, Meetup
  end

  def changeset(%Talk{} = location, attrs) do
    location
    |> cast(attrs, [:title, :slug, :description, :slide_url, :video_url])
    |> validate_required([:title, :slug, :description])
  end
end
