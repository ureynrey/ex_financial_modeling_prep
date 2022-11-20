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
    [
      ExFinancialModelingPrep.Struct.CashFlowStatement,
      ExFinancialModelingPrep.Struct.Company,
      ExFinancialModelingPrep.Struct.IncomeStatement,
      ExFinancialModelingPrep.Struct.BalanceSheetStatement,
      ExFinancialModelingPrep.Struct.Search
    ]
    |> Enum.each(& Code.ensure_loaded &1)
  end
end
