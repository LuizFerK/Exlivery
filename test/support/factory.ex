defmodule Exlivery.Factory do
  use ExMachina
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
end
