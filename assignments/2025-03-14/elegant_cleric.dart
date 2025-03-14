import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;
  String name;
  int hp;
  int mp;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

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