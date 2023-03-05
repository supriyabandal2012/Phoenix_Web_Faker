defmodule PetStoreManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PetStoreManagerWeb.Telemetry,
      # Start the Ecto repository
      PetStoreManager.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PetStoreManager.PubSub},
      # Start Finch
      {Finch, name: PetStoreManager.Finch},
      # Start the Endpoint (http/https)
      PetStoreManagerWeb.Endpoint
      # Start a worker by calling: PetStoreManager.Worker.start_link(arg)
      # {PetStoreManager.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PetStoreManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetStoreManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
