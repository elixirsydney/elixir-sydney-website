defmodule ElixirSydney.GraphQL.Schema do
  use Absinthe.Schema
  alias ElixirSydney.Meetup

  import_types Absinthe.Type.Custom

  query do
    @desc "Get the next meetup"
    field :next_meetup, type: :meetup do
      resolve fn _, _ ->
        {:ok, Meetup.next_meetup()}
      end
    end
  end

  @desc "A meetup"
  object :meetup do
    @desc "The title of the meetup"
    field :title, :string

    @desc "The slug for the meetup"
    field :slug, :string

    @desc "The date of the meetup"
    field :date, :date

    @desc "The location of the meetup"
    field :location, :string

    @desc "The maps link to the meetup"
    field :location_url, :string

    @desc "The description of the meetup"
    field :description, :string

    @desc "The Meetup.com url"
    field :url, :string
  end
end
