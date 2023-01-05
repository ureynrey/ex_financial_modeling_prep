defmodule ExFinancialModelingPrep.Factory do
  @moduledoc false
  use ExMachina

  def income_statement_factory do
    %ExFinancialModelingPrep.Struct.IncomeStatement{}
  end
end
