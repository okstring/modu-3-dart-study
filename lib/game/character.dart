import 'package:modu_3_dart_study/game/slime.dart';

void main() {
}

// 추상 클래스 : 일부가 미 정의인 클래스,
// 상속의 재료
abstract class Character {
  String name;
  int hp;

  Character({required this.name, required this.hp});

  void run() {
    print('$name가 달리다.');
  }

  // 추상 메서드
  void attack(Slime slime);
}

class Hero extends Character {
  Hero({required super.name, required super.hp});

  @override
  void attack(Slime slime) {
    // TODO: implement attack
  }
}
