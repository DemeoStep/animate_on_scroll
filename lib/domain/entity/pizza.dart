class Pizza {
  final String name;
  final String description;
  final List<int> prices;
  final String asset;

  Pizza({required this.name,
    required this.description,
    required this.prices,
    required this.asset});

  Pizza.copyOf(Pizza pizza)
      : name = pizza.name,
        description = pizza.description,
        prices = pizza.prices,
        asset = pizza.asset;
}
