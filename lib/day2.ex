defmodule Day2 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.map(fn report ->
      pairs =
        Enum.chunk_every(report, 2, 1, :discard)
        |> Enum.map(fn [a, b] -> a - b end)

      Enum.all?(pairs, fn d -> d in 1..3 end) or Enum.all?(pairs, fn d -> -d in 1..3 end)
    end)
    # & &1 is a shorthand for fn x -> x end
    |> Enum.filter(& &1)
    |> Enum.count()
  end

  def part2(input) do
    parsed =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split()
        |> Enum.map(&String.to_integer/1)
      end)

    get_diffs = fn x ->
      x
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [l, r] -> l - r end)
    end

    parsed
    |> Enum.count(fn x ->
      diffs = [
        get_diffs.(x)
        | Enum.map(1..length(x), fn y ->
            x |> List.delete_at(y - 1) |> get_diffs.()
          end)
      ]

      Enum.any?(diffs, fn y ->
        Enum.all?(y, fn d -> d in 1..3 end) or Enum.all?(y, fn d -> -d in 1..3 end)
      end)
    end)
  end
end
