defmodule ExFinancialModelingPrep.Helpers do
  @doc """
  Helper function to convert a map into specified defstruct
  """
  @spec resource_to_struct(map, any) :: %{:__struct__ => any, optional(any) => any}
  def resource_to_struct(resource, struct) do
    resource
    |> Map.to_list()
    |> Enum.map(fn {key, value} -> {String.to_existing_atom(Macro.underscore(key)), value} end)
    |> Enum.into(%{})
    |> Map.put(:__struct__, struct)
  end
end
