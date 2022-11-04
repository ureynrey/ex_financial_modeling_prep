defmodule ExFinancialModelingPrep.Struct.IncomeStatement do
  @moduledoc """
  Struct: IncomeStatement
  """
  use TypedStruct

  typedstruct do
    field(:eps, float())
    field(:operating_income_ratio, float())
    field(:accepted_date, DateTime.t())
    field(:selling_and_marketing_expenses, float())
    field(:period, String.t())
    field(:ebitdaratio, float())
    field(:ebitda, integer())
    field(:income_before_tax, integer())
    field(:general_and_administrative_expenses, float())
    field(:epsdiluted, float())
    field(:operating_expenses, integer())
    field(:total_other_income_expenses_net, integer())
    field(:reported_currency, String.t())
    field(:depreciation_and_amortization, integer())
    field(:other_expenses, float())
    field(:income_before_tax_ratio, float())
    field(:symbol, String.t())
    field(:cost_of_revenue, integer())
    field(:cost_and_expenses, integer())
    field(:weighted_average_shs_out_dil, integer())
    field(:final_link, String.t())
    field(:net_income, integer())
    field(:gross_profit_ratio, float())
    field(:filling_date, Date.t())
    field(:interest_income, float())
    field(:research_and_development_expenses, integer())
    field(:weighted_average_shs_out, integer())
    field(:cik, String.t())
    field(:link, String.t())
    field(:calendar_year, String.t())
    field(:income_tax_expense, integer())
    field(:operating_income, integer())
    field(:interest_expense, float())
    field(:net_income_ratio, float())
    field(:date, Date.t())
    field(:selling_general_and_administrative_expenses, integer())
    field(:revenue, integer())
    field(:gross_profit, integer())
  end
end
