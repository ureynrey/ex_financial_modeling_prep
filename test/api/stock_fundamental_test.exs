defmodule ExFinancialModelingPrep.Api.StockFundamentalTest do
	use ExUnit.Case
	doctest ExFinancialModelingPrep.Api.StockFundamental
	alias ExFinancialModelingPrep.Api.StockFundamental
  alias Fakes.Api.StockFundamental, as: Mock

  import Mox

  test "fiancial_statement_list/0" do
    expect(HTTPMock, :get, fn _ -> Mock.financial_statement_list() end)
    {:ok, body} = StockFundamental.financial_statement_list()
    assert is_list(body)
  end

  test "income_statement/2" do
    expect(HTTPMock, :get, fn _ -> Mock.income_statement() end)
    StockFundamental.income_statement("AAPL")
  end

end
