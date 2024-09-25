defmodule Structs.SevenWonders do
  defstruct name: "", country: ""
  alias Structs.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  @spec all :: [t()]
  def all() do
    [
      %SevenWonders{name: "Taj Mahal", country: "India"},
      %SevenWonders{name: "Chichén Itzá", country: "Mexico"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Colosseum", country: "Italy"},
      %SevenWonders{name: "The Great Wall of China", country: "China"}
    ]
  end

  @doc """
    print values in struct
  """
  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    # Enum.each(wonders, fn %{name: name} -> IO.puts(name) end)
    wonders |> Enum.each(fn %{name: name} -> IO.puts(name) end)
  end

  @doc """
    filter data in struct
  """
  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, country) do
    wonders
    |> Enum.filter(fn %{country: country_name} -> country_name == country end)
  end

  @doc """
    filter starts with
  """
  @spec in_countries_starting_with_i([t()]) :: [String.t()]
  def in_countries_starting_with_i(wonders) do
    wonders
    |> Enum.filter(fn %{country: country} -> String.starts_with?(country, "I") end)
  end

  @doc """
    sort
  """
  @spec sort_by_country_length([t]) :: [t()]
  def sort_by_country_length(wonders) do
    wonders
    |> Enum.sort(fn x, y -> String.length(x.country) < String.length(y.country) end)
  end

  @doc """
    reduce
  """
  @spec name_country_list([t]) :: [t()]
  def name_country_list(wonders) do
    wonders
    |> Enum.reduce([], fn wonder, acc -> [[wonder.name, wonder.country] | acc] end)
  end

  @spec country_name_keyword_list([t()]) :: Keyword.t()
  def country_name_keyword_list(wonders) do
    wonders
    |> Enum.reduce([], fn wonder, acc -> [{String.to_atom(wonder.country), wonder.name} | acc] end)
  end

  def all_names(wonders) do
    # wonders
    # |> Enum.map(fn wonder -> wonder.name end) # method one
    # |> Enum.map(&(&1.name)) # method two, shorthand anonymous function
    # for comprehension
    for %{name: name} <- wonders, do: name
  end
end
