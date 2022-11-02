defmodule ExFinancialModelingPrep.Fakes.API.MarketIndexes do
  alias Fakes.Api.Base

  @spec s_and_p_500_companies :: {:ok, HTTPoison.Response.t()}
  def s_and_p_500_companies() do
    Base.ok_http_response([
      %{
        "cik" => "0000066740",
        "dateFirstAdded" => "1976-08-09",
        "founded" => "1902",
        "headQuarter" => "Saint Paul, Minnesota",
        "name" => "3M",
        "sector" => "Industrials",
        "subSector" => "Industrial Conglomerates",
        "symbol" => "MMM"
      },
      %{
        "cik" => "0000091142",
        "dateFirstAdded" => "2017-07-26",
        "founded" => "1916",
        "headQuarter" => "Milwaukee, Wisconsin",
        "name" => "A. O. Smith",
        "sector" => "Industrials",
        "subSector" => "Building Products",
        "symbol" => "AOS"
      },
      %{
        "cik" => "0000001800",
        "dateFirstAdded" => "1964-03-31",
        "founded" => "1888",
        "headQuarter" => "North Chicago, Illinois",
        "name" => "Abbott",
        "sector" => "Health Care",
        "subSector" => "Health Care Equipment",
        "symbol" => "ABT"
      }
    ])
  end
end
