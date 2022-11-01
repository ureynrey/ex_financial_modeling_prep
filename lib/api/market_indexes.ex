defmodule ExFinancialModelingPrep.API.MarketIndexes do
  @moduledoc false
  alias ExFinancialModelingPrep.Structs.Company
  alias ExFinancialModelingPrep.API.Client

  @spec s_and_p_500_companies :: {:ok, [Company.t()]}
  def s_and_p_500_companies do
    Client.get("api/v3/sp500_constituent?")
    |> case do
      {:ok, %{status_code: 200, body: companies}} ->
        companies =
          Enum.map(companies, fn company ->
            {year_founded, _} = Integer.parse(company["founded"])

            %Company{
              name: company["name"],
              symbol: company["symbol"],
              sector: company["sector"],
              sub_sector: company["subSector"],
              cik: company["cik"],
              year_founded: year_founded
            }
          end)

        {:ok, companies}
    end
  end
end
