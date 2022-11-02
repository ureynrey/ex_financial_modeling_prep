defmodule ExFinancialModelingPrep.Api.Client do
  @spec get(String.t()) :: {:ok, any()} | {:error, any()}
  def get(url), do: Application.fetch_env!(:ex_financial_modeling_prep, :api_client).get(url)
end

defmodule ExFinancialModelingPrep.API.HTTPoison do
  use HTTPoison.Base
  require Logger
  @endpoint "https://financialmodelingprep.com/"

  @moduledoc """
    API Client for https://site.financialmodelingprep.com/developer/docs/
  """

  def process_response_body(body) when is_bitstring(body) and bit_size(body) > 0 do
    Jason.decode(body)
    |> case do
      {:ok, body} ->
        body

      {:error, error} ->
        Logger.info("#{__MODULE__} Failed to parse HTTP Response. #{inspect(error)}", error: error)

        body
    end
  end

  def process_url(url), do:
        @endpoint <> url <> "&apikey=#{api_key()}"

  defp api_key, do: Application.fetch_env!(:ex_financial_modeling_prep, :auth_token)
end
