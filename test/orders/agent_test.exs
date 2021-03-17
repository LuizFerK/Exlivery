defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case
  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent

  describe "save/1" do
    test "saves the order" do
      order = build(:order)

      OrderAgent.start_link(%{})

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "when the order is found, returns an order" do
      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)

      assert OrderAgent.get(uuid) == {:ok, order}
    end

    test "when the order is not found, returns an error" do
      response = OrderAgent.get("non_existent_uuid")

      expected_reponse = {:error, "Order not found"}

      assert response == expected_reponse
    end
  end
end
