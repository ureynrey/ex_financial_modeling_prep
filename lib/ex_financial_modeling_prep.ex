defmodule ExFinancialModelingPrep do
  @moduledoc """
  Documentation for `ExFinancialModelingPrep`.
  """

  alias ExFinancialModelingPrep.Api.{
    MarketIndexes,
    StockFundamental,
    StockLookUpTool
  }

  @doc false
  defdelegate s_and_p_500_companies, to: MarketIndexes

  @doc delegate_to: {StockFundamental, :financial_statement_list, 0}
  defdelegate financial_statement_list, to: StockFundamental

  @doc delegate_to: {StockFundamental, :income_statement, 2}
  defdelegate income_statement(ticker, opts), to: StockFundamental

  @doc delegate_to: {StockFundamental, :balance_sheet_statement, 2}
  defdelegate balance_sheet_statement(ticker, opts), to: StockFundamental

  @doc delegate_to: {StockFundamental, :cash_flow_statement, 2}
  defdelegate cash_flow_statement(ticker, opts), to: StockFundamental

  @doc delegate_to: {StockLookUpTool, :search, 2}
  defdelegate search(ticker_or_company, opts \\ []), to: StockLookUpTool
end
