defmodule InputParser do
  def read_input(file) do
    File.read!("inputs/" <> file)
    |> String.trim()
  end
end
