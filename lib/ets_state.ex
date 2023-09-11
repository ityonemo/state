defmodule EtsState do
  def new(content) do
    table = :ets.new(__MODULE__, [])
    :ets.insert(table, {:item, content})
    table
  end

  require MatchSpec
  @select MatchSpec.fun2ms(fn 
    {:item, content} -> content 
  end)

  def get(reference) do
    @select |> IO.inspect
    reference
    |> :ets.select(@select)
    |> List.first()
  end

  def put(reference, content) do
    :ets.insert(reference, {:item, content})
  end

  def cleanup(reference) do
    :ets.delete(reference)
    :ok
  end

  @app_envs MatchSpec.fun2ms(fn tuple = {key, _} when elem(key, 0) === :env -> tuple end)
  def all_envs do
    :ets.select(:ac_tab, @app_envs)
  end
end
