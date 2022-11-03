defmodule ExFinancialModelingPrep.Struct.IncomeStatement do
  @moduledoc """
  Type: IncomeStatement
  """
  use TypedStruct

  typedstruct do
    field(:date, String.t())
    field(:symbol, String.t())
    field(:reported_currency, String.t())
    field(:cik, String.t())
    field(:filling_date, String.t())
    field(:accepted_date, String.t())
    field(:calendar_year, String.t())
    field(:period, String.t())
    field(:revenue, integer())
    field(:cost_of_revenue, integer())
    field(:gross_profit, integer())
    field(:gross_profit_ratio, float())
    field(:research_and_development_expenses, integer())
    field(:general_and_administrative_expenses, integer())
    field(:selling_and_marketing_expenses, integer())
    field(:selling_general_and_administrative_expenses, integer())
    field(:other_expenses, float())
    field(:operating_expenses, float())
    field(:cost_and_expenses, float())
    field(:interest_income, float())
    field(:interest_expense, float())
    field(:depreciation_and_amortization, float())
    field(:ebitda, float())
    field(:ebitdaratio, float())
    field(:operating_income, float())
    field(:operating_income_ratio, float())
    field(:total_other_income_expenses_net, float())
    field(:income_before_tax, float())
    field(:income_before_tax_ratio, float())
    field(:income_tax_expense, float())
    field(:net_income, float())
    field(:net_income_ratio, float())
    field(:eps, float())
    field(:epsdiluted, float())
    field(:weighted_average_shs_out, float())
    field(:weighted_average_shs_out_dil, float())
    field(:link, String.t())
    field(:final_link, String.t())
  end
end
