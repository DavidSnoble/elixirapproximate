defmodule Aprox do
  @moduledoc """
  This module was created as a fun way to learn recursion in elixir
  """

  @doc """"
    This function approximates the number e using taylor polynomials with x = 1
  """
  def e(0), do: 1
  def e(n) when n > 0 do
    1/of(n) + e(n-1)
  end



  @doc """
  This function approximates pi using the slowly converging Gottfried Leibniz Formula
  """
  def pi(0), do: 0
  def pi(1), do: 4
  def pi(n) when n > 0 do
    val = (4/(2*n-1)*(:math.pow(-1, 1-n)))
    val + pi(n-1)
  end

  @doc """
  these private helper functions are recursive factorial functions
  """
  defp of(0), do: 1
  defp of(n) when n > 0 do
    Enum.reduce(1..n, &*/2)
  end

end
