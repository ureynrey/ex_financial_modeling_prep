import Config

config :ex_financial_modeling_prep, :http_client, ExFinancialModelingPrep.API.Client
config :ex_financial_modeling_prep, :auth_token, "a4f3822ce7adfe7d99ed313880df62fb"
config :ex_financial_modeling_prep, api_client: ExFinancialModelingPrep.API.HTTPoison

import_config "#{Mix.env()}.exs"
