defmodule State.MixProject do
  use Mix.Project

  def project do
    [
      app: :state,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {State.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "== 0.28.0"},
      {:zigler, "~> 0.10.1"},
      {:match_spec, "> 0.0.0"}
    ]
  end
end
