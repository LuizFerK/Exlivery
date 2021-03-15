defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "John Doe",
      email: "johndoe@example.com",
      cpf: "12345678900",
      age: 18,
      address: "Random street, 10"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de peperoni",
      quantity: 1,
      unity_price: Decimal.new("50.55")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Random street, 10",
      items: [
        build(:item),
        build(:item,
          description: "Açaí",
          category: :sobremesa,
          quantity: 2,
          unity_price: Decimal.new("10.20")
        )
      ],
      total_price: Decimal.new("70.95"),
      user_cpf: "12345678900"
    }
  end
end
