defmodule Tuples do
  @moduledoc """
  tuples module demonstrating actions on a tuple
  """

  @doc """
  return sample tuple
  """
  @spec sample_tuple() :: tuple()
  def sample_tuple, do: {:ok,"Sam Altman", 33}

  @doc """
  Accessing Elements in a tuple
  """
  @spec access_element(tuple(), integer()) :: any()
  def access_element(tuple_data \\ sample_tuple(), element_index), do: elem(tuple_data, element_index)

  @doc """
  Updating Elements in a tuple
  """
  @spec update_element(tuple(),integer(), any()) :: tuple()
  def update_element(tuple_data \\ sample_tuple(), element_index, value), do: put_elem(tuple_data,element_index,value)

end
