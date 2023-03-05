defmodule PetStoreManagerWeb.PetHTML do
  use PetStoreManagerWeb, :html

  embed_templates "pet_html/*"

  @doc """
  Renders a pet form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def pet_form(assigns)
end
