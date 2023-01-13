defmodule ExFinancialModelingPrep.Api.CompanyInformation do
  @moduledoc """
  [Key Executives API](https://site.financialmodelingprep.com/developer/docs/#Key-Executives)
  """
  alias ExFinancialModelingPrep.Api.Client
  alias ExFinancialModelingPrep.Helpers

  alias ExFinancialModelingPrep.Struct.KeyExecutives

  @spec key_executives(String.t()) ::
    {:ok, [KeyExecutives.t()]} |
    {:error, any()}
  def key_executives(ticker) do
    %URI{path: "v3/key-executives/#{ticker}"}
    |> URI.to_string()
    |> Client.get()
    |> case do
      {:ok, %{body: body, status_code: 200}} when is_list(body) ->
        {:ok, Enum.map(body, &Helpers.resource_to_struct(&1, KeyExecutives))}

      {:error, error} ->
        {:error, error}
    end
  end
end
