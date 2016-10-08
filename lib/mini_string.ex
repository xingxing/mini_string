defmodule MiniString do
  @moduledoc """
  最小串和值的查找
  """

  @doc """
  Doc Test:

  iex> MiniString.get([2, 6, 4, 2, 5, 8, 3, 1], 3)
  11

  iex> MiniString.get([],2)
  0

  iex> MiniString.get((1..10), 3)
  6
  """
  def get(list, size) do
    {head_list, rest_list} = Enum.split(list, size)

    head_sum = Enum.sum(head_list)
    diff =
      zipwith(&-/2, rest_list, list)
      |> Enum.scan(0, &(&1+&2))

    mini_diff = [0 | diff] |> Enum.min

    head_sum + mini_diff
  end

  @doc """
  Doc tests:

  iex> MiniString.zipwith(&-/2, [4,5,6], [1,2,3])
  [3, 3, 3]

  iex> MiniString.zipwith(&-/2, [4,5,6,10], [1,2,3])
  [3, 3, 3]
  """
  def zipwith(f, l1, l2) do
    Stream.zip(l1, l2)
    |> Enum.map(fn {a, b} -> apply(f, [a, b]) end)
  end
end
