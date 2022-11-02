import Config

config :ex_financial_modeling_prep, :http_client, ExFinancialModelingPrep.API.Client
config :ex_financial_modeling_prep, :auth_token, ""
config :ex_financial_modeling_prep, api_client: ExFinancialModelingPrep.API.HTTPoison

config :ex_financial_modeling_prep, :ex_rated,
  timeout: 10_000,
  cleanup_rate: 10_000,
  persistent: false,
  name: :ex_rated,
  ets_table_name: :ets_rated_test_buckets

import_config "#{Mix.env()}.exs"
