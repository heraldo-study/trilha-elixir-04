defmodule Flightex.Factory do
  use ExMachina
  alias Flightex.Users.User

  def user_factory do
    %User{
      name: "Jane Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
      cpf: "828.222.640-82",
      id: UUID.uuid4()
    }
  end
end
