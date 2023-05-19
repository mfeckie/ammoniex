defmodule Ammoniex.MixProject do
  use Mix.Project

  def project do
    [
      app: :ammoniex,
      version: "0.2.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: "Elixir wrapper for Rust HTML sanitizing library ammonia",
      deps: deps(),
      docs: [
        extras: ["README.md"],
        main: "readme"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      maintainers: ["Martin Feckie"],
      links: %{
        "Github" => "https://github.com/mfeckie/ammoniex"
      },
      files: ["lib", "native", "README.md", "mix.exs"],
      exclude_patterns: [
        "native/ammoniex/target"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "0.28.0"},
      {:ex_doc, "~> 0.29.4"}
    ]
  end
end
