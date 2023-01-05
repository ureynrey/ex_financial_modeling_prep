defmodule ExFinancialModelingPrep.MixProject do
  use Mix.Project

  @source_url "https://github.com/ghostkid130/ex_financial_modeling_prep"
  @description "Financial Modeling Prep library for Elixir"

  def project do
    [
      app: :ex_financial_modeling_prep,
      version: "0.1.3",
      description: @description,
      package: package(),
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ExFinancialModelingPrep.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "test/fakes"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:ex_machina, "~> 2.7.0", only: :test},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.3"},
      {:mox, "~> 1.0", only: :test},
      {:typed_struct, "~> 0.3.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp docs do
    [
      name: "Financial Modeling Prep",
      source_url: @source_url,
      extras: ["README.md"],
      groups_for_modules: [
        Types: [
          ExFinancialModelingPrep.Struct.BalanceSheetStatement,
          ExFinancialModelingPrep.Struct.CashFlowStatement,
          ExFinancialModelingPrep.Struct.Company,
          ExFinancialModelingPrep.Struct.IncomeStatement,
          ExFinancialModelingPrep.Struct.Search
        ],
        API: [
          ExFinancialModelingPrep.Api.StockFundamental,
          ExFinancialModelingPrep.Api.StockLookUpTool
        ]
      ]
    ]
  end

  def package do
    [
      description: @description,
      maintainers: ["Reynold Urena", "Dave Miner"],
      licenses: ["MIT"],
      links: %{
        "Github" => @source_url
      }
    ]
  end
end
