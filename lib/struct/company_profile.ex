defmodule ExFinancialModelingPrep.Struct.CompanyProfile do
  @moduledoc """
  Type: Company Profile
  """
  use TypedStruct

  typedstruct do
    field(:symbol, String.t())
    field(:price, integer())
    field(:beta, integer())
    field(:vol_avg, integer())
    field(:last_div, integer())
    field(:range, String.t())
    field(:changes, integer())
    field(:company_name, String.t())
    field(:currency, String.t())
    field(:cik, String.t())
    field(:isin, String.t())
    field(:cusip, String.t())
    field(:exchange, String.t())
    field(:industry, String.t())
    field(:website, String.t())
    field(:description, String.t())
    field(:ceo, String.t())
    field(:sector, String.t())
    field(:country, String.t())
    field(:full_time_employees, String.t())
    field(:is_etf, boolean())
    field(:city, String.t())
    field(:phone, String.t())
    field(:state, String.t())
    field(:address, String.t())
    field(:zip, String.t())
    field(:dcf_diff, integer())
    field(:dcf, integer())
    field(:image, String.t())
    field(:ipo_date, String.t())
    field(:default_image, boolean())
    field(:is_actively_trading, boolean())
    field(:is_adr, boolean())
    field(:is_fund, boolean())
    field(:mkt_cap, integer())
  end
end
