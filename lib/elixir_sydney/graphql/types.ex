defmodule ElixirSydney.GraphQL.Schema.Types do
  use Absinthe.Schema.Notation

  @desc "A meetup"
  object :meetup do
    @desc "The title of the meetup"
    field :title, :string

    @desc "The slug for the meetup"
    field :slug, :string

    @desc "The date of the meetup"
    field :date, :date

    @desc "The location of the meetup"
    field :location, :location

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

  @desc "A Meetup Location or Venue"
  object :location do
    @desc "The name of the Venue or Location"
    field :name, :string

    @desc "The maps url"
    field :map_url, :string
  end

  @desc "A meetup to be created"
  input_object :create_meetup_input do
    @desc "The title of the meetup"
    field :title, non_null(:string)

    @desc "The date of the meetup"
    field :date, :date

    @desc "The url of the meetup"
    field :url, :string

    #@desc "The talks at the meetup"
    #field :talks, list_of(:talk)
  end

  @desc "A meetup to be returned after meetup creation"
  object :create_meetup_payload do
    field :meetup, :meetup
  end
end
