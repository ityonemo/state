defmodule EnvState do
  def new(content) do
    System.put_env("demo", content)
    "demo"
  end

  defdelegate get(reference), to: System, as: :get_env
  defdelegate put(reference, content), 
    to: System, 
    as: :put_env

  def cleanup(_), do: :ok

  def run do
    "env"
    |> System.cmd([])
    |> elem(0)
    |> String.split()
    |> Enum.find(&(&1 =~ "demo"))
  end
end
