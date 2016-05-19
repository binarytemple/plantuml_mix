# plantuml mix task 

## Installation


Add elixirci to your list of dependencies in `mix.exs` :

        def deps do
          [
            {:plantuml_mix, "~> 0.0.1"}
          ]
        end

## Usage Examples:

```
mix plantuml
Generating images from diagrams/*.puml to diagrams
```

## `mix help plantuml`

Run plantuml, specifying source glob and destination directory.

```
mix plantuml --source "diagrams/*.puml" --dest "diagrams"
```
Args:
* `--help`  :  display this help
* `--source`: <source glob>
* `--dest`  : <destination directory>

Location: _build/dev/lib/plantuml_mix/ebin
