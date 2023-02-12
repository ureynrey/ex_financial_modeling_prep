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
    |> Enum.map(fn {key, value} ->
      {String.to_existing_atom(Macro.underscore(key)), parse_binary(value)}
    end)
    |> Enum.into(%{})
    |> Map.put(:__struct__, struct)
  end

  @doc """
  DO NOT USE:
  Creates a struct file in root directory for ease of development and speeding up process.
  Should be yeeted after project is completed.
  """
  def create_struct_file(item, module_name) do
    File.write(
      "#{Macro.underscore(module_name)}.ex",
      "defmodule ExFinancialModelingPrep.Struct.#{module_name} do
        @moduledoc \"\"\"
        Struct: #{module_name}
        \"\"\"
        use TypedStruct
        typedstruct do #{define_struct(item)} \n end
      end",
      [:write]
    )
  end

  @doc """
  Helper to quickly define types
  """
  @spec define_struct(map) :: list
  def define_struct(item) do
    item
    |> Map.to_list()
    |> Enum.map(fn {key, value} ->
      key =
        key
        |> Macro.underscore()

      type =
        cond do
          is_float(value) -> "float()"
          is_integer(value) -> "integer()"
          define_string(value) == :string -> "String.t()"
          define_string(value) == :date -> "Date.t()"
          define_string(value) == :date_time -> "DateTime.t()"
        end

      "\n           field(:#{key}, #{type})"
    end)
  end

  @doc """
  Parses Binary string to appropriate type

  ## Examples
      iex> ExFinancialModelingPrep.Helpers.parse_binary("2022-10-31")
      ~D[2022-10-31]

      iex> ExFinancialModelingPrep.Helpers.parse_binary("2022-10-27 18:01:14")
      ~U[2022-10-27 18:01:14Z]

      iex> ExFinancialModelingPrep.Helpers.parse_binary("AAPL")
      "AAPL"
  """
  @spec parse_binary(binary) :: String.t() | DateTime.t() | Date.t() | float() | integer()
  def parse_binary(value) do
    define_string(value)
    |> case do
      :date -> to_date(value)
      :date_time -> to_date_time(value)
      :string -> value
      value -> value
    end
  end

  @doc """
  Informs string type :date, :date_time, :string
  """
  @spec define_string(binary) :: :date | :date_time | :string | float() | integer()
  def define_string(string) when is_binary(string) do
    cond do
      Regex.match?(~r/^(([0-9]{4})-([0-9]{2})-([0-9]{2}))$/, string) ->
        :date

      Regex.match?(
        ~r/^(([0-9]{4})-([0-9]{2})-([0-9]{2})) ([0-9]{2}):([0-9]{2}):([0-9]{2})$/,
        string
      ) ->
        :date_time

      true ->
        :string
    end
  end

  def define_string(value), do: value

  # Converts Financial Modeling Prep date string to Date.t()
  @spec to_date(binary) :: Date.t()
  defp to_date(string) do
    string
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
    |> then(fn [year, month, day] -> Date.new!(year, month, day) end)
  end

  # Converts Financial Modeling Prep date string to DateTime.t()
  @spec to_date_time(binary) :: DateTime.t()
  defp to_date_time(string) do
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
