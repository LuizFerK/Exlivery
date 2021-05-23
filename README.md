<br />

<p align="center">
  <img alt="Logo" src="./.github/logo.png" width="120px" />
</p>

<h1 align="center" style="text-align: center;">Exlivery</h1>

<p align="center">
	<a href="https://github.com/LuizFerK">
		<img alt="Author" src="https://img.shields.io/badge/author-Luiz%20Fernando-FD944F?style=flat" />
	</a>
	<a href="#">
		<img alt="Languages" src="https://img.shields.io/github/languages/count/LuizFerK/Exlivery?color=FD944F&style=flat" />
	</a>
	<a href="hhttps://github.com/LuizFerK/Exlivery/stargazers">
		<img alt="Stars" src="https://img.shields.io/github/stars/LuizFerK/Exlivery?color=FD944F&style=flat" />
	</a>
	<a href="https://github.com/LuizFerK/Exlivery/network/members">
		<img alt="Forks" src="https://img.shields.io/github/forks/LuizFerK/Exlivery?color=FD944F&style=flat" />
	</a>
	<a href="https://github.com/LuizFerK/Exlivery/graphs/contributors">
		<img alt="Contributors" src="https://img.shields.io/github/contributors/LuizFerK/Exlivery?color=FD944F&style=flat" />
	</a>
</p>

<p align="center">
	<b>Delivery was never as easy as now!</b><br />
	<span>Created with Elixir.</span><br />
	<sub>Made with ❤️</sub>
</p>

<br />

# :pushpin: Contents

- [Features](#rocket-features)
- [Installation](#wrench-installation)
- [Getting started](#bulb-getting-started)
- [Actions](#triangular_flag_on_post-actions)
- [Techs](#fire-techs)
- [Issues](#bug-issues)
- [License](#book-license)

# :rocket: Features

- Create users
- Create orders with any item you want
- Generate reports for all the orders on the platform

# :wrench: Installation

### Required :warning:
- Elixir
- Erlang

### SSH

SSH URLs provide access to a Git repository via SSH, a secure protocol. If you have an SSH key registered in your GitHub account, clone the project using this command:

```git clone git@github.com:LuizFerK/Exlivery.git```

### HTTPS

In case you don't have an SSH key on your GitHub account, you can clone the project using the HTTPS URL, run this command:

```git clone https://github.com/LuizFerK/Exlivery.git```

**Both of these commands will generate a folder called Exlivery, with all the project**

# :bulb: Getting started

1. Run ```mix deps.get``` to install the dependencies
2. This project does not have a server, in this case, the mode of use is through IEx (Elixir's interactive shell), which can be accessed using the command ```iex -S mix``` in the project folder
3. Instead of using a database, this project uses agents to store data as states (only for studying). To start the agent, on the IEx, run `Exlivery.start_agents()`

# :triangular_flag_on_post: Actions

* Create or update user

  ```elixir
  iex(2)> Exlivery.create_or_update_user(%{name: "John Doe", address: "Random Street, 10", email: "johndoe@example.com", cpf: "12345678900", age: 18})
  {:ok, "User created or updated successfully"}
  ```

* Create or update order

  ```elixir
  iex(3)> {:ok, booking_id} = Exlivery.create_or_update_order(%{user_cpf: "12345678900", items: [%{description: "Chocolate Pizza", category: :pizza, unity_price: "50.20", quantity: 2}]})
  {:ok, "9e7b19d3-4147-45ee-85da-549ed59f72e1"}
  ```

  > Available items categories: :pizza, :hamburguer, :carne, :prato_feito, :japonesa, :sobremesa

* Generate Report

  ```elixir
  iex(5)> Exlivery.generate_report()
  :ok
  ```

  The result of this action is on `report.csv`:
  ```
  12345678900,pizza,2,50.20,100.40
  ```

# :fire: Techs

### Elixir
- Agent
- Decimal
- Elixir UUID

# :bug: Issues

Find a bug or error on the project? Please, feel free to send me the issue on the [Exlivery issues area](https://github.com/LuizFerK/Exlivery/issues), with a title and a description of your found!

If you know the origin of the error and know how to resolve it, please, send me a pull request, I will love to review it!

# :book: License

Released in 2020.

This project is under the [MIT license](https://github.com/LuizFerK/Exlivery/blob/main/LICENSE).

<p align="center">
	< keep coding /> :rocket: :heart:
</p>
