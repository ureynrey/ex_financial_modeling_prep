defmodule ExFinancialModelingPrep do

  @moduledoc """
  Documentation for `ExFinancialModelingPrep`.
  """

  alias ExFinancialModelingPrep.API.{
    MarketIndexes
  }

  @doc """
  Hello world.

  ## Examples

      iex> ExFinancialModelingPrep.hello()
      :world

  """

  defdelegate s_and_p_500_companies, to: MarketIndexes


end
