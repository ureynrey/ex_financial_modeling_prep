defmodule ExFinancialModelingPrep.Helpers do
  @moduledoc """
  Assist with assigning and defining type
  """

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

      type = cond do
        is_float(value) -> "float()"
        is_integer(value) -> "integer()"
        define_string(value) == :string -> "String.t()"
        define_string(value) == :date -> "Date.t()"
        define_string(value) == :date_time -> "DateTime.t()"
      end

      {key, type}
    end)
  end

  @doc """
  Parses Binary string to appropriate type
  """
  @spec parse_binary(binary) :: String.t() | DateTime.t() | Date.t()
  def parse_binary(value) do
    define_string(value)
    |> case do
      :date -> to_date(value)
      :date_time -> to_date_time(value)
      :string -> value
    end
  end

  @doc """
  Informs string type :date, :date_time, :string
  """
  @spec define_string(binary) :: :date | :date_time | :string
  def define_string(string) do
    cond do
      Regex.match?(~r/^(([0-9]{4})-([0-9]{2})-([0-9]{2}))$/, string) -> :date
      Regex.match?(~r/^(([0-9]{4})-([0-9]{2})-([0-9]{2})) ([0-9]{2}):([0-9]{2}):([0-9]{2})$/, string) -> :date_time
      true -> :string
    end
  end

  @doc """
  Converts Financial Modeling Prep date string to Date.t()
  """
  @spec to_date(binary) :: Date.t()
  def to_date(string) do
    string
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
    |> then(fn [year, month, day] -> Date.new!(year, month, day) end)
  end

  @doc """
  Converts Financial Modeling Prep date string to DateTime.t()
  """
  @spec to_date_time(binary) :: DateTime.t()
  def to_date_time(string) do
    [date_string, time] = String.split(string, " ")

    [hour, min, sec] =
      time
      |> String.split(":")
      |> Enum.map(&String.to_integer/1)

    time = Time.new!(hour, min, sec)
    date = to_date(date_string)

    DateTime.new!(date, time)
  end
end
