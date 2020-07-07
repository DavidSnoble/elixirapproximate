defmodule Aprox do
  @moduledoc """
  This module was created as a fun way to learn recursion in elixir
  """

  @doc """
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


  @doc """
  This is a naive recursive approach of fibonnaci
  """
  def naive(1), do: 1
  def naive(2), do: 2
  def naive(n) do
    naive(n-2) + naive(n-1)
  end


  @doc """
  This is an imporved version of fibonacci
  """
  def fib(n), do: fib(n, 0, 1)
  def fib(1, _acc1, acc2), do: acc2
  def fib(n, acc1, acc2) do
    fib(n-1, acc2, acc1 + acc2)
  end


  def time(func, arg) do
    t0 = Time.utc_now()
    func.(arg)
    Time.diff(Time.utc_now(), t0, :millisecond)

  end

  @doc """
  Comapring times of different algorithms
  """
  def compare(n \\ 40) do
    IO.puts "Naive: #{time(&naive/1, n)}"
    IO.puts "Fib: #{time(&fib/1, n)}"
    IO.puts "e: #{time(&e/1, n)}"
    IO.puts "pi: #{time(&pi/1, n)}"
  end
end
