import 'slime.dart';

import 'hero.dart';

class PoisonSlime extends Slime {
  int poisonCount = 5;
  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonCount > 0) {
      print('추가로 독 포자를 살포했다!');
      int damage = (hero.hp / 5).toInt();
      hero.hp -= damage;
      print('$damage포인트의 데미지');
      poisonCount -= 1;
    }
  }
}

void main() {
  // 20.0
  // int damage = 100 / 5;

  // int num = 20;
  // double damage = num;
}