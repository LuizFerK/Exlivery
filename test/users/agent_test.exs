defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case
  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns an user", %{cpf: cpf} do
      user = build(:user, cpf: cpf)

      UserAgent.save(user)

      assert UserAgent.get(cpf) == {:ok, user}
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("00000000000")

      expected_reponse = {:error, "User not found"}

      assert response == expected_reponse
    end
  end
end
