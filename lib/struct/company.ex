defmodule ExFinancialModelingPrep.Struct.Company do
  @moduledoc false
  @enforce_keys [:name, :symbol]
  @type t :: %__MODULE__{
          cik: String.t(),
          name: String.t(),
          sector: String.t(),
          symbol: String.t(),
          sub_sector: String.t(),
          year_founded: integer()
        }

  defstruct [
    :name,
    :cik,
    :symbol,
    :sector,
    :sub_sector,
    :year_founded
  ]
end
