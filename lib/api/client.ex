defmodule ExFinancialModelingPrep.Api.Client do
  @moduledoc false
  @spec get(String.t()) :: {:ok, any()} | {:error, any()}
  def get(url), do: Application.fetch_env!(:ex_financial_modeling_prep, :api_client).get(url)
end

defmodule ExFinancialModelingPrep.API.HTTPoison do
  @moduledoc false
  use HTTPoison.Base
  require Logger
  @base_url "financialmodelingprep.com/api"

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

  def process_url(stringified_uri) do
    uri = URI.parse(stringified_uri)

    package_api_key = fn
      nil -> "apikey=#{api_key()}"
      uri_query ->
        uri_query
        |> URI.decode_query()
        |> Map.put("apikey", api_key())
        |> URI.encode_query()
    end

    %{uri | host: @base_url, scheme: "https", query: package_api_key.(uri.query)}
    |> URI.to_string()
  end

  defp api_key, do: Application.fetch_env!(:ex_financial_modeling_prep, :auth_token)
end
