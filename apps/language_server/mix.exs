defmodule ElixirLS.LanguageServer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :language_server,
      version: "0.3.3",
      elixir: ">= 1.7.0",
      build_path: "../../_build",
      config_path: "config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: false,
      start_permanent: true,
      build_per_environment: false,
      consolidate_protocols: false,
      deps: deps()
    ]
  end

  def application do
    [mod: {ElixirLS.LanguageServer, []}, extra_applications: [:mix, :logger]]
  end

  defp deps do
    [
      {:elixir_ls_utils, in_umbrella: true},
      {:elixir_sense, github: "elixir-lsp/elixir_sense"},
      {:forms, "~> 0.0.1"},
      {:erl2ex, github: "dazuma/erl2ex"},
      {:dialyxir, "~> 1.0.0", runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
