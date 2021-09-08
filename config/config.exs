# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :project_management_example,
  ecto_repos: [ProjectManagementExample.Repo]

# Configures the endpoint
config :project_management_example, ProjectManagementExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sv8H00TKB2+J+Ck+FsjWW85SBZk1itEMAcYYi5IsCWKuomMBvuySQ3e64h0yfwbr",
  render_errors: [view: ProjectManagementExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ProjectManagementExample.PubSub,
  live_view: [signing_salt: "9pIjNhqQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
