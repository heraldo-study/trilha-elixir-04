defmodule Flightex.Users.CreateOrUpdate do
  alias Flightex.Users.User
  alias Flightex.Users.Agent

  def call(%{name: name, email: email, cpf: cpf}) do
    user = User.build(name, email, cpf)
    save_user(user)
  end

  def call(_params), do: save_user({:error, "Invalid params"})

  defp save_user({:ok, %User{} = user}) do
    Agent.save(user)
    {:ok, user.id}
  end

  defp save_user({:error, _reason} = error), do: error
end
