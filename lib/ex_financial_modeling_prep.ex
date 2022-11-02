defmodule ExFinancialModelingPrep do
  @moduledoc """
  Documentation for `ExFinancialModelingPrep`.
  """

  alias ExFinancialModelingPrep.API.{
    MarketIndexes
  }

  defdelegate s_and_p_500_companies, to: MarketIndexes
end
