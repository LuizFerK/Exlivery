defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns an user" do
      response =
        User.build(
          "Random street",
          "John Doe",
          "johndoe@example.com",
          "123456",
          18
        )

      expected_response =
        {:ok,
         %User{
           address: "Random street",
           age: 18,
           cpf: "123456",
           email: "johndoe@example.com",
           name: "John Doe"
         }}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Random street",
          "John Doe",
          "johndoe@example.com",
          "123456",
          15
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
