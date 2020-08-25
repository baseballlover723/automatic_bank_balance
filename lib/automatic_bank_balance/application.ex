defmodule AutomaticBankBalance.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AutomaticBankBalance.Repo,
      # Start the Telemetry supervisor
      AutomaticBankBalanceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AutomaticBankBalance.PubSub},
      # Start the Endpoint (http/https)
      AutomaticBankBalanceWeb.Endpoint
      # Start a worker by calling: AutomaticBankBalance.Worker.start_link(arg)
      # {AutomaticBankBalance.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AutomaticBankBalance.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AutomaticBankBalanceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
