Mox.defmock(HTTPMock, for: HTTPoison.Base)
Mox.defmock(MockExFinancialModelingPrep, for: ExFinancialModelingPrep)
Application.put_env(:ex_financial_modeling_prep, :bound, MockExFinancialModelingPrep)

ExUnit.start()
