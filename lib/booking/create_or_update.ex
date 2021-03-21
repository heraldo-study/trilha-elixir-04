defmodule Flightex.Booking.CreateOrUpdate do
  alias Flightex.Booking.Booking
  alias Flightex.Booking.Agent, as: BookingAgent
  alias Flightex.Users.Agent, as: UserAgent

  def call(user_id, %{
        data_completa: data_completa,
        cidade_origem: cidade_origem,
        cidade_destino: cidade_destino
      }) do
    with {:ok, _user} <- UserAgent.get(user_id) do
      booking = Booking.build(cidade_origem, cidade_destino, data_completa, user_id)
      save_booking(booking)
    else
      _error -> {:error, "User not found"}
    end
  end

  def call(_user_id, _params), do: save_booking({:error, "Invalid params"})

  defp save_booking({:ok, %Booking{} = booking}) do
    BookingAgent.save(booking)
    {:ok, booking.id}
  end

  defp save_booking({:error, _reason} = error), do: error
end
