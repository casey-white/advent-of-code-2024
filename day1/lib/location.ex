defmodule Location do

  def find_distance(filename \\ "./test/fixtures/test_data") do
    read_input_to_lists(filename)
    |> find_distances()
  end

  def find_similarity(filename \\ "./test/fixtures/test_data") do
    read_input_to_lists(filename)
    |> find_similarities()
  end

  def find_similarities([left, right]) do
    frequency_groups = Enum.frequencies(right)
    Enum.reduce(left, 0, fn x, acc ->
      current_freq = get_in(frequency_groups, [x])
      case current_freq do
        nil -> acc
        freq -> acc + (current_freq * x)
      end
    end)
  end

  def find_distances(lists) do
    lists
    |> Enum.zip_reduce(0, fn [left, right], acc ->
      acc + abs(left - right)
    end)
  end

  def read_input_to_lists(filename) do
    {:ok, lists} = File.read(filename)
    lists
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, "   ")))
    |> Enum.reduce([[], []], fn [x, y], [arr1, arr2] ->
      {int_x, _} = Integer.parse(x)
      {int_y, _} = Integer.parse(y)
      [[int_x | arr1], [int_y | arr2]]
    end)
    |> Enum.map(&Enum.sort(&1))
  end

end
