defmodule Lists do
  @moduledoc """

  Function Summary:

  1. sum
  """

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
