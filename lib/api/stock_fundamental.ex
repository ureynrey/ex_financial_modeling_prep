defmodule ExFinancialModelingPrep.Api.StockFundamental do
  @moduledoc """
  [Stock Fundamental API](https://site.financialmodelingprep.com/developer/docs/#Financial-Statements-List)
  """
  alias ExFinancialModelingPrep.Api.Client

  alias ExFinancialModelingPrep.Struct.{
    BalanceSheetStatement,
    CashFlowStatement,
    IncomeStatement
  }

  alias ExFinancialModelingPrep.Helpers

  @doc """
  https://site.financialmodelingprep.com/developer/docs/financial-statements-list-api/
  """
  def financial_statement_list do
    %URI{path: "/v3/financial-statement-symbol-lists"}
    |> URI.to_string()
    |> Client.get()
    |> case do
      {:ok, %{body: body, status_code: 200}} when is_list(body) ->
        {:ok, body}

      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  [Company IncomeStatement](https://site.financialmodelingprep.com/developer/docs/financial-statement-free-api/)
  """
  @spec income_statement(String.t(), Keyword.t()) ::
          {:ok, IncomeStatement.t()}
          | {:error, any()}
  def income_statement(ticker, opts \\ []) do
    limit = Keyword.get(opts, :limit, "120")
    period = Keyword.get(opts, :period, "quarter")

    query =
      %{"limit" => limit, "period" => period}
      |> URI.encode_query()

    %URI{ path: "/v3/income-statement/#{ticker}", query: query }
    |> URI.to_string()
    |> Client.get()
    |> case do
      {:ok, %{body: body, status_code: 200}} when is_list(body) ->
        {:ok, body} = {:ok, Enum.map(body, &Helpers.resource_to_struct(&1, IncomeStatement))}
        body

      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  [Company Balance Statement](https://site.financialmodelingprep.com/developer/docs/financial-statement-free-api/)
  """
  @spec balance_sheet_statement(String.t(), Keyword.t()) ::
          {:ok, BalanceSheetStatement.t()}
          | {:error, any()}
  def balance_sheet_statement(ticker, opts \\ []) do
    limit = Keyword.get(opts, :limit, "120")
    period = Keyword.get(opts, :period, "quarter")

    query =
      %{"limit" => limit, "period" => period}
      |> URI.encode_query()

    %URI{ path: "/v3/balance-sheet-statement/#{ticker}", query: query }
    |> URI.to_string()
    |> Client.get()
    |> case do
      {:ok, %{body: body, status_code: 200}} when is_list(body) ->
        {:ok, Enum.map(body, &Helpers.resource_to_struct(&1, BalanceSheetStatement))}

      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cash Flow Statement for the thingy
  """
  @spec cash_flow_statement(String.t(), Keyword.t()) ::
          {:ok, CashFlowStatement.t()}
          | {:error, any()}
  def cash_flow_statement(ticker, opts \\ []) do
    limit = Keyword.get(opts, :limit, 120)
    period = Keyword.get(opts, :period, "quarter")

    Client.get("/v3/cash-flow-statement/#{ticker}?limit=#{limit}&period=#{period}")
    |> case do
      {:ok, %{body: body, status_code: 200}} when is_list(body) ->
        {:ok, Enum.map(body, &Helpers.resource_to_struct(&1, CashFlowStatement))}

      {:error, error} ->
        {:error, error}
    end
  end
end
