defmodule Controls.CaseControl do
  @doc """
  case control
  """
  @spec case_gender(String.t()) :: String.t()
  def case_gender(gender) do
    # case gender do
    #   "m" -> "Male"
    #   "M" -> "Male"
    #   "f" -> "Female"
    #   "F" -> "Female"
    #   _ -> "Undefined"
    # end

    return_string =
      case gender do
        "m" -> "Male"
        "M" -> "Male"
        "f" -> "Female"
        "F" -> "Female"
        _ -> "Undefined"
      end

    "Could be #{return_string}"
  end
end
