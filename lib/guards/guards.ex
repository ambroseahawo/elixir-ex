defmodule Guards do
  @doc """
  check age if can drink
  """
  def can_drink(name, age) when is_number(age) and age >= 18 do
    %{name: name, age: age, can_drink: true}
  end

  def can_drink(name, age) when is_number(age) do
    %{name: name, age: age, can_drink: false}
  end

  def can_drink(_, _) do
    "Invalid"
  end
end
