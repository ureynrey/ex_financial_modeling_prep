defmodule ExFinancialModelingPrep do
  @moduledoc """
  Documentation for `ExFinancialModelingPrep`.
  """

  @behaviour ExFinancialModelingPrepBehaviours

  alias ExFinancialModelingPrep.Struct.KeyExecutives
  alias ExFinancialModelingPrep.Api.MarketIndexes
  alias ExFinancialModelingPrep.Api.CompanyInformation
  alias ExFinancialModelingPrep.Api.StockFundamental
  alias ExFinancialModelingPrep.Api.StockLookUpTool

  @doc delegate_to: {StockFundamental, :balance_sheet_statement, 2}
  @impl ExFinancialModelingPrepBehaviours
  def balance_sheet_statement(ticker, opts \\ []),
    do: StockFundamental.balance_sheet_statement(ticker, opts)

  @doc delegate_to: {StockFundamental, :cash_flow_statement, 2}
  @impl ExFinancialModelingPrepBehaviours
  def cash_flow_statement(ticker, opts \\ []),
    do: StockFundamental.cash_flow_statement(ticker, opts)

  @doc delegate_to: {CompanyInformation, :company_profile, 1}
  @impl ExFinancialModelingPrepBehaviours
  def company_profile(ticker),
    do: CompanyInformation.company_profile(ticker)

  @doc delegate_to: {StockFundamental, :financial_statement_list, 1}
  @impl ExFinancialModelingPrepBehaviours
  def financial_statement_list,
    do: StockFundamental.financial_statement_list()

  @doc delegate_to: {StockFundamental, :income_statement, 2}
  @impl ExFinancialModelingPrepBehaviours
  def income_statement(ticker, opts),
    do: StockFundamental.income_statement(ticker, opts)

  @doc delegate_to: {CompanyInformation, :key_executives, 1}
  @impl ExFinancialModelingPrepBehaviours
  @spec key_executives(String.t()) :: {:ok, [KeyExecutives.t()]} | {:error, any()}
  def key_executives(ticker),
    do: CompanyInformation.key_executives(ticker)

  @impl ExFinancialModelingPrepBehaviours
  @spec s_and_p_500_companies() :: {:ok, [ExFinancialModelingPrep.Struct.Company.t()]}
  def s_and_p_500_companies,
    do: MarketIndexes.s_and_p_500_companies()

  @doc delegate_to: {StockLookUpTool, :search, 2}
  @impl ExFinancialModelingPrepBehaviours
  @spec search(String.t(), list(Keyword.t())) :: any
  def search(ticker_or_company, opts \\ []),
    do: StockLookUpTool.search(ticker_or_company, opts)
end
