defmodule Tuples do
  @moduledoc """
  tuples module demonstrating actions on a tuple
  """

  @doc """
  return sample tuple
  """
  @spec sample_tuple() :: tuple()
  def sample_tuple, do: {"Sam Altman", 33}

  @doc """
  Accessing Elements in a tuple
  """
  @spec access_element(tuple(), integer()) :: any()
  def access_element(tuple_data \\ sample_tuple(), element_index), do: elem(tuple_data, element_index)

end
