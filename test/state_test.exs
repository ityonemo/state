defmodule StateTest do
  use ExUnit.Case
  doctest State

  test "greets the world" do
    assert State.hello() == :world
  end
end
