defmodule ElixirSydney.Person do
  use ElixirSydney, :model

  schema "person" do
    field :name, :string
    field :avatar_url, :string
    field :meetup_url, :string
    field :website_url, :string
    field :twitter, :string

    has_many :talks, ElixirSydney.Talk, foreign_key: :presenter_id
  end

end
