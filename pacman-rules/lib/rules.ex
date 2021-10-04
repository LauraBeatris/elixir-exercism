defmodule Rules do
  def eat_ghost?(has_power_pellet_active, is_touching_ghost),
    do: has_power_pellet_active and is_touching_ghost

  def score?(is_touching_power_pellet, is_touching_dot),
    do: is_touching_power_pellet or is_touching_dot

  def lose?(has_power_pellet_active, is_touching_ghost),
    do: is_touching_ghost and not has_power_pellet_active

  def win?(has_eaten_all_dots, has_power_pellet_active, is_touching_ghost),
    do: has_eaten_all_dots and not lose?(has_power_pellet_active, is_touching_ghost)
end
