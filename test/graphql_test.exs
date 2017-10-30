defmodule ElixirSydney.GraphQLTest do
  use ElixirSydney.Web.ConnCase

  alias ElixirSydney.Events

  @location_attrs %{name: "venue", address: "1 Abc St", suburb: "Sydney", postcode: "2000", state: "NSW", country: "Australia", map_url: "http://example.com"}
  @existing_meetup %{title: "some title", slug: "some_title", description: "A meetup", url: "http://example.com", date: ~D[2017-01-01], location: @location_attrs, talks: []}
  @graphql_create_meetup_request File.read!("test/fixtures/create_meetup_request.json")
  @graphql_create_meetup_request_invalid File.read!("test/fixtures/create_meetup_request_invalid.json")

  @graphql_create_meetup_expected File.read!("test/fixtures/create_meetup_response.json")

  test "create meetup with grapqhl sending valid data with only the title", context do

    Events.create_meetup(@existing_meetup)

    request = Poison.Parser.parse!(@graphql_create_meetup_request)
    expected =  Poison.Parser.parse!(@graphql_create_meetup_expected)

    res =
      context.conn
      |> post("/graphql", request)

    body = json_response(res, 200)

    next_meetup = Events.next_meetup()

    assert next_meetup.title == "amazing test title"
    assert body == expected

  end

  test "create meetup with grapqhl sending invalid data", context do

        Events.create_meetup(@existing_meetup)

        request = Poison.Parser.parse!(@graphql_create_meetup_request_invalid)

        res =
          context.conn
          |> post("/graphql", request)

        body = json_response(res, 400)

        assert body != nil

      end

end