defmodule ExFinancialModelingPrep.Fakes.Api.KeyExecutives do
  alias Fakes.Api.Base

  @spec key_executives :: {:ok, HTTPoison.Response.t()}
  def key_executives do
    Base.ok_http_response([
    %{
      "title" => "Senior Vice President of Worldwide Marketing",
      "name" => "Mr. Greg  Joswiak",
      "pay" => nil,
      "currencyPay" => "USD",
      "gender" => "male",
      "yearBorn" => nil,
      "titleSince" => nil
    },
    %{
      "title" => "Senior Director of Investor Relations & Treasury",
      "name" => "Ms. Nancy  Paxton",
      "pay" => nil,
      "currencyPay" => "USD",
      "gender" => "female",
      "yearBorn" => nil,
      "titleSince" => nil
    },
    %{
      "title" => "Chief Information Officer",
      "name" => "Ms. Mary  Demby",
      "pay" => nil,
      "currencyPay" => "USD",
      "gender" => "female",
      "yearBorn" => nil,
      "titleSince" => nil
    }
  ])
  end

end
