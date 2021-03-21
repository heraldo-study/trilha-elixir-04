defmodule Flightex.Booking.Get do
  alias Flightex.Booking.Agent, as: BookingAgent

  def call(booking_id) do
    with {:ok, booking} <- BookingAgent.get(booking_id) do
      booking
    end
  end
end
