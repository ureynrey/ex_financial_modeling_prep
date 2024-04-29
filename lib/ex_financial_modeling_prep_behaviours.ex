defmodule ExFinancialModelingPrepBehaviours do
  @moduledoc "Set of client behaviours."

  alias ExFinancialModelingPrep.Struct.KeyExecutives
  alias ExFinancialModelingPrep.Struct.IncomeStatement

  @callback s_and_p_500_companies() :: {:ok | :error, any()}

  @callback income_statement(binary(), list(Keyword.t())) ::
              {:ok, IncomeStatement.t()} | {:error, any()}

  @callback financial_statement_list() :: {:ok | :error, any()}
  @callback company_profile(String.t()) :: {:ok | :error, any()}

  @callback balance_sheet_statement(binary()) :: {:ok | :error, any()}
  @callback balance_sheet_statement(binary(), Keyword.t()) :: {:ok | :error, any()}

  @callback cash_flow_statement(binary()) :: {:ok | :error, any()}
  @callback cash_flow_statement(binary(), Keyword.t()) :: {:ok | :error, any()}

  @callback search(binary()) :: {:ok | :error, any()}
  @callback search(binary(), Keyword.t()) :: {:ok | :error, any()}

  @callback key_executives(String.t()) :: {:ok, [KeyExecutives.t()]} | {:error, any()}
end
