defmodule Lists do
  @moduledoc """
  Lists module demonstrating actions on lists
  """

  @doc """
  return sample list
  """
  def sample_list, do: [2, 3, 5, "some", :ok]

  @doc """
  Get at Index:
  If no list is provided, defaults to `sample_list/0`.
  """
  @spec get_by_index(list(), integer()) :: {:ok, any()} | {:error, String.t()}
  def get_by_index(list \\ sample_list(), index)

  # main clause that performs the access
  def get_by_index(list, index) when is_list(list) and is_integer(index) do
    actual_index = handle_negative_index(list, index)

    if actual_index >= 0 and actual_index < length(list) do
      {:ok, Enum.at(list, index)}
    else
      {:error, "Index out of range"}
    end
  end

  # fallback clause for invalid inputs
  def get_by_index(_, _), do: {:error, "Invalid inputs"}

  @doc """
  Insert at Index
  If no list is provided, defaults to `sample_list/0`.
  """
  @spec insert_by_index(list(), integer(), any()) :: {:ok, list()} | {:error, String.t()}
  def insert_by_index(list \\ sample_list(), index, value)

  # main clause that performs the insert
  def insert_by_index(list, index, value) when is_list(list) and is_integer(index) do
    actual_index = handle_negative_index(list, index)

    if actual_index >= 0 and actual_index < length(list) do
      {:ok, List.insert_at(list, index, value)}
    else
      {:error, "Index out of range"}
    end
  end

  # fallback clause for invalid inputs
  def insert_by_index(_, _, _), do: {:error, "Invalid inputs"}

  @doc """
  Update at Index
  If no list is provided, defaults to `sample_list/0`.
  """
  @spec update_by_index(list(), integer(), any()) :: {:ok, list()} | {:error, String.t()}
  def update_by_index(list \\ sample_list(), index, value)

  # main clause that performs the update
  def update_by_index(list, index, value) when is_list(list) and is_integer(index) do
    actual_index = handle_negative_index(list, index)

    if actual_index >= 0 and actual_index < length(list) do
      {:ok, List.replace_at(list, index, value)}
    else
      {:error, "index out of range"}
    end
  end

  # fallback clause for invalid inputs
  def update_by_index(_, _, _), do: {:error, "Invalid inputs"}


  @doc """
  Delete at Index
  """
  @spec delete_by_index(list(), integer()) :: {:ok, list()} | {:error, String.t()}
  def delete_by_index(list \\ sample_list(), index)

  def delete_by_index(list, index) when is_list(list) and is_integer(index) do
    actual_index = handle_negative_index(list, index)

    if actual_index >= 0 and actual_index < length(list) do
      {:ok, List.delete_at(list, index)}
    else
      {:error, "Index out of range"}
    end
  end

  # fallback clause for invalid input
  def delete_by_index(_, _), do: {:error, "Invalid inputs"}

  @spec handle_negative_index(list(), integer()) :: integer()
  defp handle_negative_index(list, index) do
    if index < 0, do: length(list) + index, else: index
  end






  @doc """
  Returns the sum of numbers in a list
  """
  @spec sum(list(number())) :: number()
  def sum(nums), do: sum_tail_rec(nums)

  @spec sum_simple(list(number())) :: number()
  def sum_simple([]), do: 0
  def sum_simple([h | t]), do: h + sum_simple(t)

  @spec sum_tail_rec(list(number()), integer()) :: number()
  def sum_tail_rec(nums, acc \\ 0)
  def sum_tail_rec([], acc), do: acc
  def sum_tail_rec([h | t], acc), do: sum_tail_rec(t, acc + h)

  @doc """
  Return sum of number in a list using enum module
  """
  @spec sum_enum(list(number())) :: number()
  def sum_enum(nums_list), do: Enum.reduce(nums_list, fn x, acc -> x + acc end)

  @doc """
  Return filtered list using enum module
  """
  @spec filter_enum(list(number())) :: list()
  def filter_enum(nums_list), do: Enum.filter(nums_list, fn x -> x > 2 end)

  @doc """
  reverse contents ina list
  """
  @spec reverse([any()], [any()]) :: [any()]
  def reverse(elements, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  @doc """
    map
  """
  @spec map([any()], (any() -> any()), [any()]) :: [any()]
  def map(elements, func, acc \\ [])
  def map([], _, acc), do: acc |> reverse()
  # when using pipe operator, the parameter is usually passed as the first parameters
  # always parentheses with pipe operator
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])

  @doc """
  enum.map
  """
  def enum_map(nums_list), do: Enum.map(nums_list, fn x -> String.to_atom(x) end)
  def enum_map_short(nums_list), do: Enum.map(nums_list, &String.to_atom/1)

  @doc """
    concat
  """
  @spec concat([any], [any]) :: [any]
  def concat(src, dst), do: concat_func(src |> reverse(), dst)

  defp concat_func([], dst), do: dst
  defp concat_func([h | t], dst), do: concat_func(t, [h | dst])

  @doc """
    flat map
  """
  def flat_map(elements, func, acc \\ [])
  def flat_map([], _, acc), do: acc
  def flat_map([h | t], func, acc), do: flat_map(t, func, concat(acc, func.(h)))

  def enum_flatten(nums_list), do: Enum.flat_map(nums_list, fn x -> [x, x * 3] end)
end
