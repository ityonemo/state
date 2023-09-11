defmodule ProcessState do
  def new(content) do
    spawn(fn -> tailcall(content) end)
  end

  def get(pid) do
    send(pid, {:get, self()})

    receive do
      {:resp, content} -> content
    end
  end

  def put(pid, content), do: send(pid, {:put, content})

  def cleanup(pid) do
    send(pid, :exit)
    :ok
  end

  defp tailcall(content) do
    receive do
      :exit ->
        :ok

      {:get, rsvp} ->
        send(rsvp, {:resp, content})
        tailcall(content)

      {:put, new_content} ->
        tailcall(new_content)
    end
  end
end
