defmodule FileNaiveState do
  def new(content) do
    path = Path.join(System.tmp_dir!(), "demo")
    File.write!(path, content)
    path
  end

  defdelegate get(filepath), to: File, as: :read!
  defdelegate put(filepath, content), 
    to: File, 
    as: :write!

  def cleanup(_), do: :ok
end
