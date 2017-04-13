defmodule ElixirSydney.GraphQL.Schema do
  use Absinthe.Schema
  alias ElixirSydney.Events

  import_types Absinthe.Type.Custom

  query do
    @desc "Get the next meetup"
    field :next_meetup, type: :meetup do
      resolve fn _, _ ->
        {:ok, Events.next_meetup}
      end
    end

    @desc "Get the previous meetups"
    field :previous_meetups, type: list_of(:meetup) do
      resolve fn _, _ ->
        {:ok, Events.past_meetups}
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

    @desc "The talks at the meetup"
    field :talks, list_of(:talk)
  end

  @desc "A talk at a meetup"
  object :talk do
    @desc "The title of the talk"
    field :title, :string

    @desc "The slug for the talk"
    field :slug, :string

    @desc "The description of the talk"
    field :description, :string

    @desc "The speaker of the talk"
    field :presenter, :person
  end

  @desc "A person"
  object :person do
    @desc "The name of the person"
    field :name, :string

    @desc "The slug for the person"
    field :slug, :string

    @desc "The persons avatar url"
    field :avatar_url, :string

    @desc "The persons Meetup.com url"
    field :meetup_url, :string

    @desc "The persons website url"
    field :website_url, :string

    @desc "The persons twitter handle"
    field :twitter_handle, :string
  end
end
