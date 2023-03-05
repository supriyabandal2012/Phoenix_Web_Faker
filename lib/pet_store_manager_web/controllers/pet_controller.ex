defmodule PetStoreManagerWeb.PetController do
  use PetStoreManagerWeb, :controller

  alias PetStoreManager.Customers
  alias PetStoreManager.Customers.Pet

  def index(conn, _params) do
    pets = Customers.list_pets()
    render(conn, :index, pets: pets)
  end

  def new(conn, _params) do
    changeset = Customers.change_pet(%Pet{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"pet" => pet_params}) do
    case Customers.create_pet(pet_params) do
      {:ok, pet} ->
        conn
        |> put_flash(:info, "Pet created successfully.")
        |> redirect(to: ~p"/pets/#{pet}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pet = Customers.get_pet!(id)
    render(conn, :show, pet: pet)
  end

  def edit(conn, %{"id" => id}) do
    pet = Customers.get_pet!(id)
    changeset = Customers.change_pet(pet)
    render(conn, :edit, pet: pet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pet" => pet_params}) do
    pet = Customers.get_pet!(id)

    case Customers.update_pet(pet, pet_params) do
      {:ok, pet} ->
        conn
        |> put_flash(:info, "Pet updated successfully.")
        |> redirect(to: ~p"/pets/#{pet}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, pet: pet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet = Customers.get_pet!(id)
    {:ok, _pet} = Customers.delete_pet(pet)

    conn
    |> put_flash(:info, "Pet deleted successfully.")
    |> redirect(to: ~p"/pets")
  end
end
