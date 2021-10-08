defmodule FreelancerRates do
  @moduledoc """
  Utilities to calculate daily and monthly rates,
  optionally with a given discount
  """

  @month_billable_days_quantity 22
  @daily_rate 8.0

  def daily_rate(hourly_rate), do: hourly_rate * @daily_rate

  def apply_discount(before_discount, discount) do
    with_discount = before_discount * discount / 100
    before_discount - with_discount
  end

  defp daily_discounted_rate(hourly_rate, discount) do
    hourly_rate |> daily_rate |> apply_discount(discount)
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_discounted_rate(hourly_rate, discount) * @month_billable_days_quantity)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / daily_discounted_rate(hourly_rate, discount)) |> Float.floor(1)
  end
end
