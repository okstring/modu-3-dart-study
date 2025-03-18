class Hero {
  static const int maxHp = 50;
  String name;
  int _hp;

  int get hp => _hp;

  set hp(int value) {
    _hp = value.clamp(0, maxHp);
  }

  Hero({required this.name, required int hp}) : _hp = hp;
}
