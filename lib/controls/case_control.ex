defmodule Controls.CaseControl do
  @doc """
  case control
  """
  # @spec case_control(String) :: String
  def case_gender(gender) do
    case gender do
      "m" -> "Male"
      "M" -> "Male"
      "f" -> "Female"
      "F" -> "Female"
      _ -> "Undefined"
    end
  end
end
