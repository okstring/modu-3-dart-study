import 'hero.dart';
import 'monster.dart';

class Slime extends Monster {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= 10;
  }

  @override
  void run() {
    print('2번');
  }
}
