defmodule PetStoreManager.Repo do
  use Ecto.Repo,
    otp_app: :pet_store_manager,
    adapter: Ecto.Adapters.Postgres
end
