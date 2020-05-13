# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tutopoint,
  ecto_repos: [Tutopoint.Repo]

# Configures the endpoint
config :tutopoint, TutopointWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hwZtj/p4dme6UJBXQ6mCTo3xS+gMuTYqyBkWRkEvHcF1GeZLpphhLG7WpMV6Z+st",
  render_errors: [view: TutopointWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tutopoint.PubSub,
  live_view: [signing_salt: "kZz+EB4X"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :tutopoint, :pow,
  user: Tutopoint.Users.User,
  repo: Tutopoint.Repo

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
