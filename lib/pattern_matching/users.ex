defmodule PatternMatching.Users do
  def new("James", age) do
    %{name: "James", age: age, is_cool: true}
  end

  def new(name, age) do
    %{name: name, age: age, is_cool: false}
  end

  def new, do: generate_default_user()

  def generate_default_user do
    %{name: "John Doe", age: 20, is_cool: false}
  end
end
