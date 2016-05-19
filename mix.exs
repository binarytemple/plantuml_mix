defmodule Plantuml.Mixfile do
  use Mix.Project

  def project do
    [app: :plantuml_mix,
     version: "0.0.1",
     description: """
     Add plantuml task to mix.
     Execute mix plantuml --help for options.
     Requires that the env var PLANTUML_JAR points to a valid PlantUML jar file.
     Requires Java > 1.6 installed on the system.
     """,
     package: [
      licenses: ["MIT"],
      maintainers: ["binarytemple"],
      links: %{github: "https://github.com/binarytemple/plantuml_mix"   }
     ],
          elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     #, ensure_structure: ensure_structure
     ]
  end

#  def ensure_structure(config \\ [], opts \\ []) do 
#    IO.puts "#{ inspect {config,opts} } "
#  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [
      :logger
      #,:httpoison 
      ]
    ]
  end



  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
    #   {:httpoison, "~> 0.5"} 
    ]
  end
end
