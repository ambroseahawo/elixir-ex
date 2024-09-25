# executing in the ascending stage
defmodule Recursion.PrintDigits do
  # Base case
  def up_to(0), do: 0

  def up_to(num) do
    IO.puts(num)
    up_to(num - 1)
  end
end

# executing in the return stage
# defmodule Scripts.Recursion.PrintDigits do
#   # Base case
#   def up_to(0), do: 0

#   def up_to(num) do
#     up_to(num - 1)
#     IO.puts(num)
#   end
# end
