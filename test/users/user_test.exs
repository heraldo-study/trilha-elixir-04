defmodule FlightexTest.Users.UserTest do
  use ExUnit.Case
  alias Flightex.Users.User

  describe "build/3" do
    test "should create a user" do
      res = User.build("heraldo", "heraldo@teste.com", "489.847.770-48")
      assert {:ok, user} = res
    end
  end
end
