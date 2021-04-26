# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elog,
  ecto_repos: [Elog.Repo]

config :elog, Elog.Repo, migration_primary_key: [type: :binary_id]

# Configures the endpoint
config :elog, ElogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zur7eHEehMMmQgRbLNfppO+GhAk/gZrZY57HF86fi+eIcYe6fCbnQF5NcxjWSO3T",
  render_errors: [view: ElogWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Elog.PubSub,
  live_view: [signing_salt: "Y8ZRP8sL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
