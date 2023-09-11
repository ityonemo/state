defmodule PortState do
  def new(content) do
    Port.open(
      {:spawn, "mix port #{content}"}, [:binary]
    )
  end

  def get(port) do
      Port.command(port, "get\n")

      result =
        receive do
          {^port, {:data, content}} -> 
            String.trim(content)
        end
      result
  end

  def put(port, content) do
    Port.command(port, "#{content}\n")
  end

  def cleanup(port) do
    Port.command(port, "exit\n")
    :ok
  end
end
