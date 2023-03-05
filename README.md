# PetStoreManager
@Author: Supriya Bandal
To create a project:
  * Run `mix phx.new pet_store_manager` to create a project called pet_store_manager.

  * Run `cd pet_store_manager` to get into project directory
  * Run `mix phx.gen.html Customers Pet pets name:string species:string breed:string owner:string age:float` to create list/table database.(make sure postgres is working)
  * copy the output `resources "/pets", PetController` and paste it in `router.ex` file and *R Run `mix ecto.migrate`

Faker Library usage:
we used `faker` library to create fake data API, so faker dependensies to be added in `test->mix.exs` file with version.(eg:{:faker, "~> 0.17"}) and * Run `mix deps.get`

Write the Code:
Implement the code in `seeds.exs` and * Run `mix run priv/repo/seeds.exs` to 

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
# Phoenix_App-Faker-Library
