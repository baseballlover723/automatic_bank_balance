# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :automatic_bank_balance,
  ecto_repos: [AutomaticBankBalance.Repo]

# Configures the endpoint
config :automatic_bank_balance, AutomaticBankBalanceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CeiiVHFDsZe01Q8LzuwfpBjMtp8pexrvJrG7iCHWhTabZTvQt4zJkQeXqvWZT6qA",
  render_errors: [view: AutomaticBankBalanceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AutomaticBankBalance.PubSub,
  live_view: [signing_salt: "z2Xp1BM+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
