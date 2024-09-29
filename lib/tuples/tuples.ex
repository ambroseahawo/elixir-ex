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
  If no tuple is provided, defaults to `sample_tuple/0`.
  """
  @spec access_element(tuple(), integer()) :: {:ok, any()} | {:error, String.t()}
  def access_element(tuple_data \\ sample_tuple(), element_index)

  # main clause that performs the tuple access
  def access_element(tuple_data, element_index) when is_tuple(tuple_data) do
    if element_index < tuple_size(tuple_data) and element_index >= 0 do
      {:ok, elem(tuple_data, element_index)}
    else
      {:error, "Index out of range"}
    end
  end

  # fallback clause for invalid inputs
  def access_element(_,_), do: {:error, "Invalid tuple"}

  @doc """
  Updating Elements in a tuple
  If no tuple is provided, defaults to `sample_tuple/0`.
  """
  @spec update_element(tuple(),integer(), any()) :: {:ok, tuple()} | {:error, String.t()}
  def update_element(tuple_data \\ sample_tuple(), element_index, value)

  # main clause that performs the tuple update
  def update_element(tuple_data, element_index, value) when is_tuple(tuple_data) do
    if element_index < tuple_size(tuple_data) and element_index >= 0 do
      {:ok, put_elem(tuple_data,element_index,value)}
    else
      {:error, "Index out of range"}
    end
  end

  # fallback clause for invalid inputs
  def update_element(_,_,_), do: {:error, "Invalid tuple"}

  @doc """
  Inserting into Tuple (Using Lists)
  If no tuple is provided, defaults to `sample_tuple/0`.
  """
  @spec insert_element(tuple(),integer(),any()) :: {:ok, tuple()} | {:error, String.t()}
  def insert_element(tuple_data \\ sample_tuple(), element_index, value)

  # main clause that performs the insert
  def insert_element(tuple_data, element_index, value) when is_tuple(tuple_data) do
    list = Tuple.to_list(tuple_data)
    if element_index <= length(list) and element_index >= 0 do
      # {:ok, List.to_tuple(List.insert_at(list,element_index,value))}
      {:ok, list |> List.insert_at(element_index, value) |> List.to_tuple}
    else
      {:error, "Index out of range"}
    end
  end

  # fallback clause for invalid inputs
  def insert_element(_,_,_), do: {:error, "Invalid tuple"}

end
