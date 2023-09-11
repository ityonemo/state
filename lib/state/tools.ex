defmodule Trace do
  def start(pid) do
    future =
      Task.async(fn ->
        :erlang.trace(pid, true, [:call])

        try do
          :erlang.trace(pid, true, [:call])
        rescue
          ArgumentError ->
            []
        else
          _ ->
            :erlang.trace_pattern({:_, :_, :_}, true, [:local])

            fn ->
              receive do
                {:trace, ^pid, :call, {mod, fun, args}} -> {mod, fun, args}
                :stop_trace -> :stop_trace
              end
            end
            |> Stream.repeatedly()
            |> Stream.take(50)
            |> Enum.take_while(&(&1 != :stop_trace))
        end
      end)

    Process.put(:trace_future, future)
    :ok
  end

  def stop do
    future = Process.get(:trace_future)
    send(future.pid, :stop_trace)
    Task.await(future)
  end
end
