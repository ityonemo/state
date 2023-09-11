defmodule AtomicState do
  def new(content) do
    array = :atomics.new(1, [])
    :atomics.put(array, 1, content)
    array
  end

  def get(array) do
    :atomics.get(array, 1)
  end

  def put(array, content) do
    :atomics.exchange(array, 1, content)
  end

  # note these are gc'd
  def cleanup(_), do: :ok
end
