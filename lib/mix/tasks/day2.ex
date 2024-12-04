defmodule Mix.Tasks.Day2 do
  use Mix.Task

  def run(_) do
    input = InputParser.read_input("day2.txt")
    IO.puts("Part 1: #{Day2.part1(input)}")
    IO.puts("Part 2: #{Day2.part2(input)}")
  end
end
