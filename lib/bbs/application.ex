defmodule BBS.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {BBS.MessageRepository, ["Welcome to My Bulletin Board!"]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BBS.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
