class Filter {
  final String id;
  final String name;
  const Filter({required this.id, required this.name});
}

List<Filter> dummyFilters = [
  const Filter(
    id: "1",
    name: "All",
  ),
  const Filter(
    id: "2",
    name: "Latest",
  ),
  const Filter(
    id: "3",
    name: "Most Popular",
  ),
  const Filter(
    id: "4",
    name: "Cheapest",
  ),
];
