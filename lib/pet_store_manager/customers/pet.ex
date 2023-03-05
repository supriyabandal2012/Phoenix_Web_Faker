defmodule PetStoreManager.Customers.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :age, :float
    field :breed, :string
    field :name, :string
    field :owner, :string
    field :species, :string

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :species, :breed, :owner, :age])
    |> validate_required([:name, :species, :breed, :owner, :age])
  end
end
