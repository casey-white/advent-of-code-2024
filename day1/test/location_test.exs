defmodule LocationTest do
  use ExUnit.Case
  doctest Location

  test "processes the test data" do
    assert Location.find_distance == 11
  end

  test "processes the input data" do
    assert Location.find_distance("./test/fixtures/input_data") == 2164381
  end

  test "finds similarities of test data" do
    assert Location.find_similarity == 31
  end

  test "finds similarities of inputu data" do
    assert Location.find_similarity("./test/fixtures/input_data") |> IO.inspect()
  end
end
