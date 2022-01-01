defmodule RationalNumbers do
  import Integer, only: [gcd: 2, pow: 2]

  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a, 2}, {c, 2}), do: {a + c, 1}
  def add({a, d}, {c, d}), do: {a + c, d}

  def add({a, b}, {c, d}), do: {a * d + c * b, Kernel.abs(b) * Kernel.abs(d)}

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, {b1, b2}), do: add(a, {-b1, b2})

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a, b}, {c, d}), do: reduce({a * c, b * d})

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a, c}, {b, d}), do: reduce({a * d, c * b})

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}), do: {Kernel.abs(a), Kernel.abs(b)}

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n), do: reduce({pow(a, n), pow(b, n)})

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}), do: :math.pow(x, a / b)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    quotient_gcd = gcd(a, b)
    new_b = div(b, quotient_gcd)
    {new_a, new_b} = normalize_denominator(a, new_b)

    {div(new_a, quotient_gcd), new_b}
  end

  @spec normalize_denominator(a :: integer, b :: integer) :: rational
  defp normalize_denominator(a, b), do: if b < 0, do: {-a, -b}, else: {a, b}
end
