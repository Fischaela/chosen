# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :podcasterinnen,
  ecto_repos: [Podcasterinnen.Repo]

# Configures the endpoint
config :podcasterinnen, PodcasterinnenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Z7qCcnFrY7IokUdUEp7LaQI0gI8V0ikkIqqDtOuTHy+dIlJs2kyzlBI9qlDgAGdp",
  render_errors: [view: PodcasterinnenWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Podcasterinnen.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configures Ueberauth
config :ueberauth, Ueberauth,
  providers: [
    auth0: { Ueberauth.Strategy.Auth0, [] },
  ]

# Configures Ueberauth's Auth0 auth provider
config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: System.get_env("AUTH0_DOMAIN"),
  client_id: System.get_env("AUTH0_CLIENT_ID"),
  client_secret: System.get_env("AUTH0_CLIENT_SECRET")
