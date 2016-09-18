defmodule Api.Mixfile do
  use Mix.Project

  def project do
    [app: :elixirhunt,
     name: "elixirhunt",
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Elixirhunt, []},
     applications: [:phoenix, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex, :httpoison, :edeliver]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.1.4"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_ecto, "~> 2.0"},
     {:gettext, "~> 0.9"},
     {:cowboy, "~> 1.0"},
     {:faker_elixir_octopus, "> 0.0.0", only: :dev},
     {:httpoison, "~> 0.9.0"},
     {:sshex, "2.1.0"},
     {:edeliver, ">= 1.4.0"},
     {:distillery, ">= 0.8.0", warn_missing: false}
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]
    ]
  end
end
