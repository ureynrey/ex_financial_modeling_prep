defmodule ExFinancialModelingPrep.Api.StockLookUpTool do
  @moduledoc """
  [Stock Look Up Tool API](https://site.financialmodelingprep.com/developer/docs/#Stock-News)
  """
  alias ExFinancialModelingPrep.Api.Client
  alias ExFinancialModelingPrep.Struct.Search

  @spec search(String.t()) :: {:ok, [Search.t()]} | {:error, HTTPoison.Error.t()}
  def search(ticker_or_company) do
    query =
      %{"query" => ticker_or_company}
      |> URI.encode_query()

    %URI{path: "/v3/search", query: query}
    |> URI.to_string()
    |> Client.get()
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
