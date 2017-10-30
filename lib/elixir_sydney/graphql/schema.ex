defmodule ElixirSydney.GraphQL.Schema do
  use Absinthe.Schema
  alias ElixirSydney.Events

  import_types Absinthe.Type.Custom
  import_types ElixirSydney.GraphQL.Schema.Types

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

  mutation do
    @desc "Create new meetup"
    field :create_meetup, type: :create_meetup_payload do
      arg :input, :create_meetup_input

      resolve fn %{input: attrs}, _ ->
        case Events.create_meetup(attrs) do
          {:ok, result} ->  {:ok, %{meetup: Map.from_struct(result)}}
          {:error, error} -> {:error, error}
        end

      end
    end
  end

end
