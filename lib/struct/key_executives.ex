defmodule ExFinancialModelingPrep.Struct.KeyExecutives do
  @moduledoc """
  Type: Key Executives
  """
  use TypedStruct

  typedstruct do
    field :name, String.t(), enforce: true
    field :title, String.t(), enforce: true
    field :pay, integer()
    field :currency_pay, String.t()
    field :gender, String.t()
    field :year_born, integer()
    field :title_since, integer()
  end

end
