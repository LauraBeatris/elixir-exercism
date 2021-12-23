defmodule GuessingGame do
  # Before declaring multiple clauses, define function header with default argument
  def compare(secret_number, guess \\ :no_guess)

  # First & second clause are using pattern matching according to given args
  def compare(_, :no_guess), do: "Make a guess"
  def compare(secret_number, secret_number), do: "Correct"

  # The last clauses are using guards to prevent executing the functions based on arguments evaluations
  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"
  def compare(secret_number, guess) when secret_number < guess, do: "Too high"
  def compare(secret_number, guess) when secret_number > guess, do: "Too low"
end
