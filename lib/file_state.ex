defmodule FileState do
  def new(content) do
    device =
      System.tmp_dir!()
      |> Path.join("demo")
      |> File.open!([:read, :write, :binary])

    IO.write(device, content)
    device
  end

  def get(device) do
    :file.position(device, 0)
    result = IO.read(device, 1000)
    result
  end

  def put(device, content) do
    :file.position(device, 0)
    IO.write(device, content)
    :file.truncate(device)
    :ok
  end

  def cleanup(device) do
    File.close(device)
  end
end
