defmodule Lasagna do
  @moduledoc """
  Functions to help to cook a brilliant lasagna
  """

  @minutes_in_total 40
  @minutes_per_layer 2

  def expected_minutes_in_oven, do: @minutes_in_total

  def remaining_minutes_in_oven(oven_minutes_spent),
    do: expected_minutes_in_oven() - oven_minutes_spent

  def preparation_time_in_minutes(lasagna_layers_number),
    do: lasagna_layers_number * @minutes_per_layer

  def total_time_in_minutes(lasagna_layers_number, oven_minutes_spent),
    do: preparation_time_in_minutes(lasagna_layers_number) + oven_minutes_spent

  def alarm, do: "Ding!"
end
