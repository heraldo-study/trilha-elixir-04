defmodule Flightex do
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Booking.Agent, as: BookingAgent
  alias Flightex.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Flightex.Booking.CreateOrUpdate, as: CreateOrUpdateBooking
  alias Flightex.Booking.Get, as: GetBooking

  defdelegate create_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_booking(user_id, params), to: CreateOrUpdateBooking, as: :call
  defdelegate get_booking(booking_id), to: GetBooking, as: :call

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end
end
