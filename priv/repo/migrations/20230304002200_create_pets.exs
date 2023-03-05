defmodule PetStoreManager.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string
      add :species, :string
      add :breed, :string
      add :owner, :string
      add :age, :float

      timestamps()
    end
  end
end
