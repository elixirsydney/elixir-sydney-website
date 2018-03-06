defmodule ElixirSydney.Web.Router do
  use ElixirSydney.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      json_decoder: Poison
  end

  scope "/", ElixirSydney.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/code_of_conduct", PageController, :code_of_conduct
    get "/meetups", PageController, :meetups
    get "/meetup/:slug", PageController, :meetup, param: "slug"
  end

  scope "/graphql" do
    pipe_through :api

    forward "/", Absinthe.Plug,
      schema: ElixirSydney.GraphQL.Schema
  end

  scope "/graphiql" do
    pipe_through :api

    forward "/", Absinthe.Plug.GraphiQL,
      schema: ElixirSydney.GraphQL.Schema
  end
end
