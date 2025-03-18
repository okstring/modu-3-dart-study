import 'hero.dart';

class Slime {
  static const String tenDamageMsg = '10의 데미지';
  static String attackMsg(String suffix) => '슬라임$suffix이/가 공격했다';

  final String suffix;
  int hp = 50;

  Slime(this.suffix);

  void attack(Hero hero) {
    print(attackMsg(suffix));
    print(tenDamageMsg);
    hero.hp -= 10;
  }
}