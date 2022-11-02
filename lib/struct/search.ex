defmodule ExFinancialModelingPrep.Struct.Search do
  @enforce_keys [:symbol]
  @type t :: %__MODULE__{
          currency: String.t(),
          exchange_short_name: String.t(),
          name: String.t(),
          stock_exchange: String.t(),
          symbol: String.t()
        }

  defstruct [
    :currency,
    :exchange_short_name,
    :name,
    :stock_exchange,
    :symbol
  ]
end
