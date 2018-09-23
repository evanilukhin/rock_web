# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rock_web,
  ecto_repos: [RockWeb.Repo]

# Configures the endpoint
config :rock_web, RockWebWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9XxUNd6W7DW8pOVYFt5fY9BPlQeSm1fdrqGKM6yNP/RVEFb7EC2Ha9DQ+qQLk4qr",
  render_errors: [view: RockWebWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RockWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :rock_web, RockWeb.Repo,
  adapter:  Ecto.Adapters.Postgres,
  username: System.get_env("ROCK_USER"),
  password: System.get_env("ROCK_PASS"),
  database: System.get_env("ROCK_DATABASE"),
  hostname: System.get_env("ROCK_HOST"),
  pool_size: 10

config :amqp,
  username: System.get_env("RABBIT_LOGIN"),
  password: System.get_env("RABBIT_PASS"),
  host: System.get_env("RABBIT_HOST"),
  port: System.get_env("RABBIT_PORT")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
