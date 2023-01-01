# ExFinancialModelingPrep

An unofficial API Client library for [ExFinancialModelingPrep](https://site.financialmodelingprep.com/developer/docs/?gclid=CjwKCAjw5P2aBhAlEiwAAdY7dPUuKTdX0awGZEXEnNenthIedABa7ip6mLgwVmgCjUYmndmihcKRbhoCa5oQAvD_BwE) 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_financial_modeling_prep` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_financial_modeling_prep, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_financial_modeling_prep>.

## Testing:
This library leverages mocks using [Mox's](https://github.com/dashbitco/mox) to mock API calls to financial modeling prep. Consuming libraries leveraging looking to utilize this API client library can also leverage Mox to mock api calls. 

1. Add Mock to test_helper.ex file 
```
Mox.defmock(MockExFinancialModelingPrep, for: ExFinancialModelingPrep)
```

## Author note:
- My first open source project. Feel free to contribute or point me to resources on managing open source contributions if you have any tips. Participation encouraged ;^D