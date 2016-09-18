use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :elixirhunt, Elixirhunt.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [],
  url: [host: "www.elixirhunt.dev", port: 4000]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :elixirhunt, Elixirhunt.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "makis123",
  database: "elixirhunt_dev",
  hostname: "localhost",
  pool_size: 10

# Finally import the config/dev.secret.exs
# which should be versioned separately.
import_config "dev.secret.exs"