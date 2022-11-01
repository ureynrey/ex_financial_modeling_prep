defmodule ExFinancialModelingPrep.Api.StockFundamental do
  alias ExFinancialModelingPrep.Api.Client
  alias ExFinancialModelingPrep.Struct.IncomeStatement
  alias ExFinancialModelingPrep.Helpers

  @moduledoc false

  @doc """
  https://site.financialmodelingprep.com/developer/docs/financial-statements-list-api/
  """
  def financial_statement_list() do
    Client.get("/api/v3/financial-statement-symbol-lists?")
    |> case do
      {:ok, %{body: body, status_code: 200}} when is_list(body) ->
        {:ok, body}

      {:error, error} -> {:error, error}
    end
  end


  @doc """
  [Company IncomeStatement](https://site.financialmodelingprep.com/developer/docs/financial-statement-free-api/)
  """
  @spec income_statement(String.t(), Keyword.t()) ::
    {:ok, IncomeStatement.t} |
    {:error, any()}
  def income_statement(ticker, opts \\ []) do
    limit = Keyword.get(opts, :limit, 120)
    period = Keyword.get(opts, :period, "quarter")

    Client.get("/api/v3/income-statement/#{ticker}?limit=#{limit}&period=#{period}")
    |> case do
      {:ok, %{body: body, status_code: 200}} when is_list(body) ->
        Enum.map(body, &Helpers.resource_to_struct(&1, IncomeStatement))

      {:error, error} ->
        {:error, error}
    end
  end
end
