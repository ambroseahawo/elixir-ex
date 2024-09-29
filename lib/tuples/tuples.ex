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
  def access_element(tuple \\ sample_tuple(), index)

  # main clause that performs the tuple access
  def access_element(tuple, index) when is_tuple(tuple) do
    if index < tuple_size(tuple) and index >= 0 do
      {:ok, elem(tuple, index)}
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
  @spec update_element(tuple(), integer(), any()) :: {:ok, tuple()} | {:error, String.t()}
  def update_element(tuple \\ sample_tuple(), index, value)

  # main clause that performs the tuple update
  def update_element(tuple, index, value) when is_tuple(tuple) do
    if index < tuple_size(tuple) and index >= 0 do
      {:ok, put_elem(tuple,index,value)}
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
  @spec insert_element(tuple(), integer(),any()) :: {:ok, tuple()} | {:error, String.t()}
  def insert_element(tuple \\ sample_tuple(), index, value)

  # main clause that performs the insert
  def insert_element(tuple, index, value) when is_tuple(tuple) do
    list = Tuple.to_list(tuple)
    # handle negative index
    actual_index = if index < 0, do: length(list) + index, else: index

    if actual_index < 0 or actual_index > length(list) - 1 do
      {:error, "Index out of range"}
    else
      # {:ok, List.to_tuple(List.insert_at(list,index,value))}
      {:ok, list |> List.insert_at(index, value) |> List.to_tuple}
    end
  end

  # fallback clause for invalid inputs
  def insert_element(_,_,_), do: {:error, "Invalid tuple"}

  @doc """
  Deleting from Tuple (Using Lists)
  If no tuple is provided, defaults to `sample_tuple/0`.
  """
  @spec delete_element(tuple(), integer()) :: {:ok, tuple()} | {:error, String.t()}
  def delete_element(tuple \\ sample_tuple(), index)

  # main clause that performs the deletion
  def delete_element(tuple, index) when is_tuple(tuple) do
    list = Tuple.to_list(tuple)

    # handle negative index
    actual_index = if index < 0, do: length(list) + index, else: index

    if actual_index < 0 or actual_index > length(list) - 1 do
      {:error, "Index out of range"}
    else
      # {:ok, List.to_tuple(List.delete_at(list, index))}
      {:ok, list |> List.delete_at(index) |> List.to_tuple}
    end
  end

  # fallback clause for invalid inputs
  def delete_element(_,_), do: {:error, "Invalid tuple"}

end
