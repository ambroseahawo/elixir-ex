defmodule Controls.IfControl do
  @doc """
  if control
  """
  def if_male(gender) do
    # if gender == "m" do
    #     "Male"
    #   else
    #     "Female"
    #   end
    gender_ =
      if gender == "m" do
        "Male"
      else
        "Female"
      end

    "Could be #{gender_}"
  end
end
