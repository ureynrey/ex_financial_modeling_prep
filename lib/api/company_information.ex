defmodule ExFinancialModelingPrep.Api.CompanyInformation do
  alias ExFinancialModelingPrep.Api.Client
  alias ExFinancialModelingPrep.Helpers

  alias ExFinancialModelingPrep.Struct.{
    CompanyProfile,
    KeyExecutives
  }

  @moduledoc """
  Company Information APIs
  """

  @doc """
  [Key Executives API](https://site.financialmodelingprep.com/developer/docs/#Key-Executives)
  """
  @spec key_executives(String.t()) ::
          {:ok, [KeyExecutives.t()]}
          | {:error, any()}
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

  @doc """
  https://site.financialmodelingprep.com/developer/docs/#Company-Profile
  """
  @spec company_profile(String.t()) ::
          {:ok, [ComapnyProfile.t()]}
          | {:ok, :no_results}
          | {:error, any()}
  def company_profile(ticker) when is_bitstring(ticker) do
    %URI{path: "/v3/profile/#{ticker}"}
    |> URI.to_string()
    |> Client.get()
    |> case do
      {:ok, %{body: [body], status_code: 200}} ->
        {:ok, Helpers.resource_to_struct(body, CompanyProfile)}

      {:error, error} ->
        {:error, error}
    end
  end
end
