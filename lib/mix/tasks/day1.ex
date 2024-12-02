defmodule Mix.Tasks.Day1 do
  use Mix.Task

  def run(_) do
    input = InputParser.read_input("day1.txt")
    IO.puts("Part 1: #{Day1.part1(input)}")
    IO.puts("Part 2: #{Day1.part2(input)}")
  end
end
