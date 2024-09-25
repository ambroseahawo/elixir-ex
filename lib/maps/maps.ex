defmodule Maps do
  @doc """
  sample map
  """
  @spec book_map() :: map()
  def book_map do
    %{
      title: "Programming Elixir",
      author: %{
        first_name: "Micheal",
        last_name: "Dave"
      },
      year: 2010
    }
  end

  @doc """
  access map field
  """
  @spec access_field(map(), atom()) :: any()
  def access_field(book_map \\ book_map(), field), do: book_map[field]

  @doc """
  change key value in a map
  """
  @spec map_put(map(), atom(), String) :: map()
  def map_put(book_map \\ book_map(), key, value), do: Map.put(book_map, key, value)

  @spec map_fetch(map(), any()) :: :error | {:ok, any()}
  @doc """
  access field via Map.fetch
  """
  @spec map_fetch(map(), atom()) :: {atom(), any()}
  def map_fetch(book_map \\ book_map(), key), do: Map.fetch(book_map, key)
  # def map_fetch(book_map \\ book_map(), key) do
  #   {:ok, result} = Map.fetch(book_map, key)
  #   result
  # end
end
