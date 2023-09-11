defmodule UdpState do
  def new(content) do
    {:ok, socket} = 
      :gen_udp.open(0, active: false, mode: :binary)
    :gen_udp.connect(socket, {127, 0, 0, 1}, 6666)
    :gen_udp.send(socket, content)
    socket
  end

  def get(socket) do
    :gen_udp.send(socket, "get")
    {:ok, {_ip, _port, msg}} = :gen_udp.recv(socket, 1000)
    msg
  end

  def put(socket, content) do
    :gen_udp.send(socket, content)
  end

  def cleanup(socket) do
    :gen_udp.close(socket)
  end
end
