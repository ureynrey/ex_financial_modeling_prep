defmodule ExFinancialModelingPrep do
  @moduledoc """
  Documentation for `ExFinancialModelingPrep`.
  """

  alias ExFinancialModelingPrep.Struct.KeyExecutives

  alias ExFinancialModelingPrep.Api.{
    CompanyInformation,
    StockFundamental,
    StockLookUpTool,
    CompanyInformation
  }

  @callback s_and_p_500_companies() :: {:ok | :error, any()}
  @callback income_statement(binary(), Keyword.t()) ::
              {:ok, IncomeStatement.t()} | {:error, any()}
  @callback financial_statement_list() :: {:ok | :error, any()}
  @callback balance_sheet_statement(binary(), Keyword.t()) :: {:ok | :error, any()}
  @callback cash_flow_statement(binary(), Keyword.t()) :: {:ok | :error, any()}
  @callback search(binary(), Keyword.t()) :: {:ok | :error, any()}
  @callback key_executives(String.t()) :: {:ok, KeyExecutives.t() | :error, any()}

  @spec s_and_p_500_companies :: any
  def s_and_p_500_companies, do: impl(:market_indexes).s_and_p_500_companies()

  @doc delegate_to: {StockFundamental, :financial_statement_list, 0}
  def financial_statement_list, do: impl(:stock_fundamental).financial_statement_list()

  @doc delegate_to: {StockFundamental, :income_statement, 2}
  def income_statement(ticker, opts), do: impl(:stock_fundamental).income_statement(ticker, opts)

  @doc delegate_to: {StockFundamental, :balance_sheet_statement, 2}
  def balance_sheet_statement(ticker, opts \\ []),
    do: impl(:stock_fundamental).balance_sheet_statement(ticker, opts)

  @doc delegate_to: {StockFundamental, :cash_flow_statement, 2}
  def cash_flow_statement(ticker, opts \\ []),
    do: impl(:stock_fundamental).cash_flow_statement(ticker, opts)

  @doc delegate_to: {StockLookUpTool, :search, 2}
  @spec search(any, any) :: any
  def search(ticker_or_company, opts \\ []),
    do: impl(:stock_lookup_tool).search(ticker_or_company, opts)

  @doc delegate_to: {CompanyInformation, :key_executives, 1}
  @spec key_executives(String.t()) :: KeyExecutives.t()
  def key_executives(ticker),
    do: impl(:company_information).key_executives(ticker)

  defp impl(module), do: Application.get_env(:ex_financial_modeling_prep, :impl)[module]
end
