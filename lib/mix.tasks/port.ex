defmodule Mix.Tasks.Port do
  use Mix.Task

  def run([init]) do
    loop(init)
  end

  defp loop(value) do
    case IO.gets("") do
      "get" <> _ ->
        IO.puts(value)
        loop(value)

      "exit" <> _ ->
        :ok

      value ->
        loop(String.trim(value))
    end
  end
end
