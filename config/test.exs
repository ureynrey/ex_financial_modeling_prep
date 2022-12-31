import Config

config :ex_financial_modeling_prep, :http_client, ExFinancialModelingPrep.API.Client
config :ex_financial_modeling_prep, :auth_token, ""
config :ex_financial_modeling_prep, api_client: HTTPMock

config :ex_financial_modeling_prep, :impl,
  stock_fundamental: MockExFinancialModelingPrep,
  stock_lookup_tool: MockExFinancialModelingPrep
