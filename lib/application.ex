defmodule ExFinancialModelingPrep.Application do
  @moduledoc false
  use Application
  @impl true
  def start(_, _) do
    ensure_structs_loaded()
    opts = [strategy: :one_for_one, name: ExFinancialModelingPrep.Supervisor]
    Supervisor.start_link([], opts)
  end

  # Atoms fails to load due because BEAM loads things lazily. This funciton ensure atom declared in struct
  # are ready to be consumes on a `String.to_exisiting_atom/1`
  defp ensure_structs_loaded do
    # Ensures that all atoms are loaded. Supports `ExFinancialModelingPrep.Helpers.resource_to_struct/2`
    {:ok, list_of_modules} = :application.get_key(:ex_financial_modeling_prep, :modules)
    Code.ensure_all_loaded(list_of_modules)
  end
end
