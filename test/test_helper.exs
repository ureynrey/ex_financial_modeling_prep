Mox.defmock(HTTPMock, for: HTTPoison.Base)
Mox.defmock(ExFinancialModelingPrep, for: ExFinancialModelingPrepBehaviours)
# Application.put_env(:ex_financial_modeling_prep, :bound, MockExFinancialModelingPrep)

# Ensures that all atoms are loaded. Supports `ExFinancialModelingPrep.Helpers.resource_to_struct/2`
{:ok, list_of_modules} = :application.get_key(:ex_financial_modeling_prep, :modules)
Code.ensure_all_loaded(list_of_modules)

ExUnit.start()
