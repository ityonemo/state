defmodule SocketState do
  def new(content) do
    {:ok, socket} = :socket.open(:inet, :dgram, :udp)
    :socket.connect(socket, 
      %{family: :inet, port: 6666, addr: :loopback})
    :socket.send(socket, content)
    socket
  end

  def get(socket) do
    :socket.send(socket, "get")
    {:ok, msg} = :socket.recvmsg(socket)
    IO.iodata_to_binary(msg.iov)
  end

  def put(socket, content) do
    :socket.send(socket, content)
  end

  def cleanup(socket) do
    :socket.close(socket)
  end
end
