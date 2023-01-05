defmodule ExFinancialModelingPrep.Struct.IncomeStatementTest do
  use ExUnit.Case
  doctest ExFinancialModelingPrep.Struct.IncomeStatement
  alias ExFinancialModelingPrep.Struct.IncomeStatement

  import ExFinancialModelingPrep.Factory

  test "factory" do
    assert %IncomeStatement{} = build(:income_statement)
  end
end
