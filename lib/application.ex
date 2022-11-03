defmodule ExFinancialModelingPrep.Application do
  use Application
  @impl true
  def start(_, _) do
    ensure_structs_loaded()
    opts = [strategy: :one_for_one, name: ExFinancialModelingPrep.Supervisor]
    Supervisor.start_link([], opts)
  end

  # Atoms fails to load due because BEAM loads things lazily. This funciton ensure atom declared in struct are ready to be consumes on a `String.to_exisiting_atom/1`
  defp ensure_structs_loaded() do
    {:ok, files} = File.ls("lib/struct")

    Enum.map(files, fn file_in_struct ->
      Macro.camelize(file_in_struct)
      |> String.replace(".ex", "")
      |> then(&"Elixir.ExFinancialModelingPrep.Struct.#{&1}")
      |> String.to_existing_atom()
      |> Code.ensure_loaded()
    end)
  end
end
