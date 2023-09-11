defmodule State.UdpServer do
  use GenServer
  def start_link(_), do: GenServer.start_link(__MODULE__, [])

  def init(_) do
    {:ok, socket} = :gen_udp.open(6666, active: true, mode: :binary)
    {:ok, %{socket: socket, content: ""}}
  end

  defp do_message("get", from, state) do
    :gen_udp.send(state.socket, from, state.content)
    {:noreply, state}
  end

  defp do_message(packet, _, state) do
    {:noreply, %{state | content: packet}}
  end

  def handle_info({:udp, _, ip, port, packet}, state) do
    do_message(packet, {ip, port}, state)
  end
end
