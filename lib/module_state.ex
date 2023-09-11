defmodule ModuleState do
  def new(content) do
    compile(random_module_name(), content)
  end

  def get(module) do
    module.__info__(:attributes)[:content]
  end

  def put(module, content) do
    compile(module, content)
    :ok
  end

  defp compile(module, content) do
    {{:module, ^module, _, _}, _} = Code.eval_quoted(
      quote do
        defmodule unquote(module) do
          # what's the bug here?
          Module.register_attribute(__MODULE__, :content, persist: true)
          @content unquote(content)
        end
      end
    )
    module
  end

  defp random_module_name do
    8
    |> :crypto.strong_rand_bytes()
    |> Base.encode16()
    |> String.replace_prefix("", "module_")
    |> String.to_atom()
  end

  def cleanup(_), do: :ok
end
