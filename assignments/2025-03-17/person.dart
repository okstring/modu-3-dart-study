class Person {
  final String name;
  final int birthYear;

  int get age {
    final currentDateTime = DateTime.now();
    final currentYear = currentDateTime.year;
    return currentYear - birthYear;
  }

  Person({required this.name, required this.birthYear});
}

main() {}
