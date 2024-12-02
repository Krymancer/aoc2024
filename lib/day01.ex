defmodule Day1 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
    |> (fn {left_list, right_list} ->
          Enum.zip(Enum.sort(left_list), Enum.sort(right_list))
        end).()
    |> Enum.map(fn {left, right} -> abs(left - right) end)
    |> Enum.sum()
  end

  def part2(input) do
    {left_list, right_list} =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split()
        |> Enum.map(&String.to_integer/1)
        |> List.to_tuple()
      end)
      |> Enum.unzip()

    frequency_map =
      Enum.reduce(right_list, %{}, fn num, acc ->
        Map.update(acc, num, 1, &(&1 + 1))
      end)

    Enum.reduce(left_list, 0, fn num, acc ->
      acc + num * Map.get(frequency_map, num, 0)
    end)
  end
end
