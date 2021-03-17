defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "John Doe",
        address: "Random street, 10",
        email: "johndoe@example.com",
        cpf: "12345678900",
        age: 18
      }

      response = CreateOrUpdate.call(params)

      expected_reponse = {:ok, "User created or updated successfully"}

      assert response == expected_reponse
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "John Doe",
        address: "Random street, 10",
        email: "johndoe@example.com",
        cpf: "12345678900",
        age: 17
      }

      response = CreateOrUpdate.call(params)

      expected_reponse = {:error, "Invalid parameters"}

      assert response == expected_reponse
    end
  end
end
