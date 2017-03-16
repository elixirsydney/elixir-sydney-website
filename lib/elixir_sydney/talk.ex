defmodule ElixirSydney.Talk do
  use ElixirSydney, :model

  schema "talk" do
    field :title, :string
    field :slug, :string
    field :description, :string
    field :slide_url, :string
    field :video_url, :string

    belongs_to :presenter, ElixirSydney.Person
  end
end
