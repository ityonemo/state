defmodule State.Application do
  use Application

  def start(_, _) do
    children = [State.UdpServer]

    Supervisor.start_link(children, strategy: :one_for_one, name: __MODULE__)
  end
end
