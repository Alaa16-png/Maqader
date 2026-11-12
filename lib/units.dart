const Map<String, double> unitRatios = {
  'cup': 1,
  'tbsp': 1 / 16,
  'tsp': 1 / 48,
};

double convertToGrams(
    double amount,
    double gramsPerCup,
    String unit,
    ) {
  return amount * gramsPerCup * (unitRatios[unit] ?? 1);
}