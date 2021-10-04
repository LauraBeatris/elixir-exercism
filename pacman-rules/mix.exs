defmodule Rules.MixProject do
  use Mix.Project

  def project do
    [
      app: :pacman_rules,
      version: "0.1.0",
      # elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end
end
