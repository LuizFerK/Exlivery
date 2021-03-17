defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case
  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      Exlivery.start_agents()

      cpf = "12345678900"
      user = build(:user, cpf: cpf)

      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pizza de mussarela",
        quantity: 1,
        unity_price: "50.20"
      }

      item2 = %{
        category: :sobremesa,
        description: "Açaí",
        quantity: 2,
        unity_price: "10.10"
      }

      {:ok, cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves an order", %{cpf: cpf, item1: item1, item2: item2} do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with the given cpf, returns an error", %{
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: "non_existent_cpf", items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end

    test "when there are invalid items, returns an error", %{cpf: cpf, item1: item1, item2: item2} do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid items"}

      assert response == expected_response
    end

    test "when there are no items, returns an error", %{cpf: cpf} do
      params = %{user_cpf: cpf, items: []}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
