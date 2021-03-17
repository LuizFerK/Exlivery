defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  import Exlivery.Factory

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns an user" do
      response =
        User.build(
          "Random street, 10",
          "John Doe",
          "johndoe@example.com",
          "12345678900",
          18
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Random street, 10",
          "John Doe",
          "johndoe@example.com",
          "12345678900",
          17
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
