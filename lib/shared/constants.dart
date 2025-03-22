class Categories {
  final String name;
  final String icon;

  Categories({required this.name, required this.icon});
}

final List<Categories> categories = [
  Categories(name: "All", icon: "assets/icons/travel.svg"),
  Categories(name: "Hotel", icon: "assets/icons/hotel.svg"),
  Categories(name: "Restaurants", icon: "assets/icons/restaurant.svg"),
];
