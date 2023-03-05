defmodule PetStoreManager.CustomersTest do
  use PetStoreManager.DataCase

  alias PetStoreManager.Customers

  describe "pets" do
    alias PetStoreManager.Customers.Pet

    import PetStoreManager.CustomersFixtures

    @invalid_attrs %{age: nil, breed: nil, name: nil, owner: nil, species: nil}

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Customers.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Customers.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      valid_attrs = %{age: 120.5, breed: "some breed", name: "some name", owner: "some owner", species: "some species"}

      assert {:ok, %Pet{} = pet} = Customers.create_pet(valid_attrs)
      assert pet.age == 120.5
      assert pet.breed == "some breed"
      assert pet.name == "some name"
      assert pet.owner == "some owner"
      assert pet.species == "some species"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      update_attrs = %{age: 456.7, breed: "some updated breed", name: "some updated name", owner: "some updated owner", species: "some updated species"}

      assert {:ok, %Pet{} = pet} = Customers.update_pet(pet, update_attrs)
      assert pet.age == 456.7
      assert pet.breed == "some updated breed"
      assert pet.name == "some updated name"
      assert pet.owner == "some updated owner"
      assert pet.species == "some updated species"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_pet(pet, @invalid_attrs)
      assert pet == Customers.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Customers.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Customers.change_pet(pet)
    end
  end
end
