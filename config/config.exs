# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_sydney,
  ecto_repos: [ElixirSydney.Repo]

# Configures the endpoint
config :elixir_sydney, ElixirSydney.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fBlFB6+IhpNM2yNUQNpxVmUvv/Q80zxyypcZlkyqNi+cFAP0sDHsarayilJXWlBc",
  render_errors: [view: ElixirSydney.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirSydney.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :elixir_sydney, meetup_api_key: System.get_env("MEETUP_API_KEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
