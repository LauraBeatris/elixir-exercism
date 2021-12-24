defmodule KitchenCalculator do
  # Using attributes to not hardcode values without semantic meaning
  # Another approach: Declare private functions with multiple clauses for each factor, using pattern matching for each unit
  @factor_per_unit %{
    cup: 240,
    teaspoon: 5,
    milliliter: 1,
    tablespoon: 15,
    fluid_ounce: 30
  }

  # Pattern matching on the function clause to get volume
  def get_volume({_unit, volume}), do: volume

  # Accessing map attribute with given unit
  def to_milliliter({unit, volume}), do: {:milliliter, volume * @factor_per_unit[unit]}
  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / @factor_per_unit[unit]}

  # Using pipe operator to pass the transformed volume to milliliter & then transform to the given unit
  def convert(volume_pair, unit), do: volume_pair |> to_milliliter |> from_milliliter(unit)
end
