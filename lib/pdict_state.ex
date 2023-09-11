defmodule PdictState do
  def new(content) do
    Process.put(:demo, content)
    :demo
  end

  defdelegate get(key), to: Process
  defdelegate put(key, value), to: Process

  def cleanup(_), do: :ok

  def inspect do
    self()
    |> :erlang.process_info()
    |> get_in([:dictionary, :demo])
  end
end
