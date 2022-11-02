defmodule ExFinancialModelingPrep.Api.StockLookUpTool do
  alias ExFinancialModelingPrep.Struct.Search
  alias ExFinancialModelingPrep.Api.Client

  @spec search(String.t(), [tuple()]) :: {:ok, [Search.t()]} | {:error, HTTPoison.Error.t()}
  def search(ticker_or_company, opts \\ []) do
    Enum.into(opts ++ [query: ticker_or_company], %{})
    |> URI.encode_query()
    |> (&Client.get("api/v3/search?" <> &1)).()
    |> case do
      {:ok, %{status_code: 200, body: companies}} ->
        Enum.map(companies, fn company ->
          %Search{
            currency: company["currency"],
            exchange_short_name: company["exchangeShortName"],
            name: company["name"],
            stock_exchange: company["stockExchange"],
            symbol: company["symbol"]
          }
        end)

      {:error, error} ->
        {:error, error}
    end
  end
end
