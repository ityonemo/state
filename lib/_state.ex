defmodule State do
  def string_demo(module) do
    reference = module.new("foo")
    IO.inspect(reference, label: "reference")
    IO.inspect(module.get(reference), label: "initialized value")
    module.put(reference, "bar")
    IO.inspect(module.get(reference), label: "mutated value")
    module.cleanup(reference)
  end

  def int_demo(module) do
    reference = module.new(42)
    IO.inspect(reference, label: "reference")
    IO.inspect(module.get(reference), label: "initialized value")
    module.put(reference, 47)
    IO.inspect(module.get(reference), label: "mutated value")
    module.cleanup(reference)
  end
end
