defmodule PersistentTermState do
  def new(content) do
    key = make_ref()
    :persistent_term.put(key, content)
    key
  end

  defdelegate get(key), to: :persistent_term
  defdelegate put(key, value), to: :persistent_term

  defdelegate cleanup(key), 
    to: :persistent_term, 
    as: :erase
end
  