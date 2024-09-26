defmodule Pipe do
  def pipe_func do
    [1, 3, 7, 8, 16, 4]
    |> Enum.filter(fn x -> x > 5 end)
    |> Enum.map(fn x -> x + 10 end)
    |> Enum.reduce(fn acc, x -> acc + x end)
    |> IO.puts()
  end
end
