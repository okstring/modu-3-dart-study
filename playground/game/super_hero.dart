import 'hero.dart';

void main() {
  final superHero = SuperHero(name: 'name', hp: 100);
  // superHero.run();
}

// SuperHero : Sub Class (자식)
// Hero : Super Class (부모)
class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp}) {
    print('2번');
  }

  @override
  void run() {
    super.run();
    print('멋지게 뛰었다');
  }
}
