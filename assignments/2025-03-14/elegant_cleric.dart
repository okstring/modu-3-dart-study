import 'dart:math';

class Cleric {
  static final int maxHp = 50;
  static final int maxMp = 10;
  String name;
  int hp;
  int mp;

  Cleric(this.name, {int? hp, int? mp})
    : hp = hp ?? Cleric.maxHp,
      mp = mp ?? Cleric.maxMp;

  void selfAid() {
    if (mp >= 5) {
      hp = maxHp;
      mp -= 5;
    }
  }

  int pray(int second) {
    final int randomPoint = Random().nextInt(3);
    final healMp = randomPoint + second;
    final healedMp = mp + healMp > maxMp ? maxMp - mp : healMp;
    mp += healedMp;
    return healedMp;
  }
}

main() { }