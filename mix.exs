defmodule AutomaticBankBalance.MixProject do
  use Mix.Project

  def project do
    [
      app: :automatic_bank_balance,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:mix]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}, # static code analysis
      {:flow, "~> 1.0"}, # collection iteration
      {:money, "~> 1.7"}, # money library
      {:typed_struct, "~> 0.2.1"}, # easy typed structs
    ]
  end
end
