# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PetStoreManager.Repo.insert!(%PetStoreManager.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# 1..50
# |> Enum.each(fn _ ->
#   PetStoreManager.Repo.insert!(%PetStoreManager.Customers.User{
#     name: Faker.Dog.PtBr.name(),
#     species: Faker.Person.species(),
#     breed: Faker.Person.breed(),
#     owner: Faker.Person.owner(),
#     age: Enum.random(20..100) / 1
#   })
# end)

alias PetStoreManager.Repo
alias PetStoreManager.Customers.Pet

pet_changeset = fn pet ->
  pet
  |> Ecto.Changeset.cast(%{}, [:name, :breed, :owner, :age, :species])
  |> Ecto.Changeset.validate_required([:owner, :species])
  |> Ecto.Changeset.validate_length(:name, min: 3, max: 20)
  |> Ecto.Changeset.validate_length(:breed, allow_blank: true)
end

1..50
|> Enum.flat_map(fn _ ->
  [
    %Pet{
      name: Faker.Dog.PtBr.name(),
      breed: Faker.Dog.PtBr.breed(),
      owner: Faker.Person.last_name(),
      age: :rand.uniform(10) * 1.0,
      species: "dog"
    }
    |> pet_changeset.(),
    %Pet{
      name: Faker.Cat.En.name(),
      breed: Faker.Cat.En.breed(),
      owner: Faker.Person.last_name(),
      age: :rand.uniform(10) * 1.0,
      species: "cat"
    }
    |> pet_changeset.()
  ]
end)
|> Enum.map(&Repo.insert(&1))
