defmodule Fakes.Api.StockFundamental do
  alias Fakes.Api.Base

  def financial_statement_list() do
    Base.ok_http_response([
      "ETH",
      "GOGN",
      "000540.SZ",
      "603931.SS",
      "JMG.L",
      "067900.KS",
      "ERM.L",
      "BSP.AX",
      "SBFMW",
      "LVCLY",
      "CPAH",
      "JGLE.JK",
      "SMWN.DE",
      "EMAARDEV.AE",
      "0729.HK",
      "CYBN",
      "CHG",
      "PLUGD",
      "FVTID",
      "0440.HK",
      "GOAU4.SA",
      "1930.HK",
      "CDTI",
      "PRCX",
      "688133.SS",
      "SCRM",
      "SHALPAINTS.NS",
      "..."
    ])
  end
end
