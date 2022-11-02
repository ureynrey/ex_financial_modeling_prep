defmodule ExFinancialModelingPrep.Helpers do
  @doc """
  Helper function to convert a map into specified defstruct when parsing through HTTP response with defined structs
  """
  @spec resource_to_struct(map, any) :: %{:__struct__ => any, optional(any) => any}
  def resource_to_struct(resource, struct) do
    resource
    |> Map.to_list()
    |> Enum.map(fn {key, value} -> {String.to_existing_atom(Macro.underscore(key)), value} end)
    |> Enum.into(%{})
    |> Map.put(:__struct__, struct)
    |> IO.inspect(label: :output)
  end


  @doc """
  Helper to quickly define types modules
  """
  @spec defined_struct_type(map) :: list
  def defined_struct_type(item) do
    item
    |> Map.to_list()
    |> Enum.map(fn {key, value} ->
      key =
        key
        |> Macro.underscore()
        |> String.to_atom()

      value_type = fn
        value when is_binary(value) -> "String.t()"
        value when is_integer(value) -> "integer()"
        value when is_float(value) -> "float()"
      end

      {key, value_type.(value)}
    end)
  end
end
