defmodule Mix.Tasks.Plantuml do
  use Mix.Task
  @shortdoc "Run plantuml shortdoc"
  @moduledoc """ 
    Run plantuml, specifying source glob and destination directory.
    
    ```
    mix plantuml --source "diagrams/*.puml" --dest "diagrams"
    ```
    Args:
    * `--help`  :  display this help
    * `--source`: <source glob>
    * `--dest`  : <destination directory>
    """

  def run(args) do
    
    opts = OptionParser.parse(args ,strict: [source: :string, dest: :string, help: :boolean],aliases: [h: :help])
    #IO.puts "#{inspect opts}"

    case opts do 
      {keywords, [], []} -> case Keyword.has_key?(keywords, :help) do 
                              true -> IO.puts @moduledoc
                              false -> case opts do 
                                {[source: source , dest: dest], [], []} -> Mix.Tasks.Plantuml.execute_plantuml_binary(source,dest)
                                {[], [], []} -> Mix.Tasks.Plantuml.execute_plantuml_binary 
                              end
                            end
      other -> IO.puts "unhandled: #{inspect {args,other} }"
    end
  end

  #def find_files(path \\ "diagrams/**/*.puml", callbacks \\ []) do 
  #  for file <- Path.wildcard(path),
  #  File.dir?(file) == false,
  #  callback <- callbacks,
  #  cbr <- [callback.(file)],
  #  do: {cbr,file}
  #  #do: {file}
  #end

  def execute_plantuml_binary(sourcedir \\ "diagrams/*.puml", targetdir \\ "diagrams") do 
    IO.puts( "Generating images from #{sourcedir} to #{targetdir}")

    case System.get_env("PLANTUML_JAR") do
      nil -> raise "PLANTUML_JAR env variable is not set"  
      plantuml_jar when is_binary(plantuml_jar) -> 
        try do
          {output,_status} = System.cmd "/usr/bin/java", [
          "-jar",
          "-Djava.awt.headless=true", 
          plantuml_jar, 
          sourcedir,
          targetdir 
          ], 
          env: [{"MIX_ENV", "test"}] 
          {:ok,output}
        rescue
          e -> {:error, e} 
        end
    end
  end

  #def sample() do 
  #  cmd=&Mix.Tasks.Plantuml.find_files/2
  #  callback=&Mix.Tasks.Plantuml.execute_plantuml_binary/2
  #  cmd.("diagrams/**/*.puml", [ fn x -> callback.(x,x <> ".jpeg" ) end ])
  #end

end
