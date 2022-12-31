defmodule ExFinancialModelingPrepTest do
  use ExUnit.Case
  doctest ExFinancialModelingPrep
  alias ExFinancialModelingPrep

  import Mox

  setup :verify_on_exit!

  test "Mox: income_statement/2" do
    expect(MockExFinancialModelingPrep, :income_statement, fn _, _ -> {:ok, :income_statement} end)

    assert {:ok, :income_statement} = ExFinancialModelingPrep.income_statement("AMD", [])
  end

  test "Mox: financial_statement_list/0" do
    expect(MockExFinancialModelingPrep, :financial_statement_list, fn ->
      {:ok, :financial_statement_list}
    end)

    assert {:ok, :financial_statement_list} = ExFinancialModelingPrep.financial_statement_list()
  end

  test "Mox: balance_sheet_statement/2" do
    expect(MockExFinancialModelingPrep, :balance_sheet_statement, fn _, _ ->
      {:ok, :balance_sheet_statement}
    end)

    assert {:ok, :balance_sheet_statement} =
             ExFinancialModelingPrep.balance_sheet_statement("AMD")
  end

  test "Mox: cash_flow_statement/2" do
    expect(MockExFinancialModelingPrep, :cash_flow_statement, fn _, _ ->
      {:ok, :cash_flow_statement}
    end)

    assert {:ok, :cash_flow_statement} = ExFinancialModelingPrep.cash_flow_statement("AMD")
  end

  test "Mox: search/2" do
    expect(MockExFinancialModelingPrep, :search, fn _, _ -> {:ok, :search} end)

    assert {:ok, :search} = ExFinancialModelingPrep.search("AMD")
  end

  test "Mox: s_and_p_500_companies/0" do
    expect(MockExFinancialModelingPrep, :s_and_p_500_companies, fn ->
      {:ok, :s_and_p_500_companies}
    end)

    assert {:ok, :s_and_p_500_companies} = ExFinancialModelingPrep.s_and_p_500_companies()
  end
end
