defmodule Structs.Customer do
  alias Structs.Customer

  @type entity_id :: integer()
  @type t :: %Customer{id: entity_id, first_name: String.t(), last_name: String.t()}
  defstruct id: 0, first_name: "", last_name: ""
end

defmodule CustomerDao do
  alias Structs.Customer

  @type reason :: String.t()
  @spec get_customer(Customer.entity_id()) :: {:ok, Customer.t()} | {:error, reason}
  def get_customer(id) do
    IO.puts("Searching customer with id #{id}")

    # other necessary code

    if is_integer(id) and id > 0 do
      {:ok, %Customer{id: id, first_name: "Mike"}}
    else
      {:error, "Invalid id #{id}"}
    end
  end
end
