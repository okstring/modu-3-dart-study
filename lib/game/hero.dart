import 'character.dart';
import 'moveable.dart';
import 'slime.dart';
import 'attackable.dart';
import 'sword.dart';

void main() {
  print(Hero.money);

  Hero hero = Hero(hp: 100, name: '홍길동');

  Sword sword = Sword(name: '불의 검', damage: 10);
  Hero hero2 = Hero(hp: 100, name: '홍길동', sword: sword);
}

// PascalCase
class Hero extends Character implements Attackable, Moveable {
  static const int maxHp = 100;

  // 정적인 변수
  static int money = 100;

  String name; // non-nullable
  int hp;
  Sword? sword; // nullable

  // named parameter
  Hero({required this.name, required this.hp, this.sword}) : super(name: '', hp: 0);


  void run() {
    print('뛰었다');
    Hero.money = 200;
    Hero hero = Hero(name: 'name', hp: 100);
    hero.name;
  }

  void sleep() {
    hp = 100;
    print('$name 이 잠을잤다');
  }

  @override
  void attack(Slime slime) {
    print('공격했다');
  }

  @override
  void move() {
    print('3발자굴 이동');
  }
}

// void main() {
//   int i = 10;
//   // 인스턴스 생성
//   Hero hero = Hero('홍길동', 100);
//   hero.attack();
//
//   print(hero.name);
//
//   hero.hp = 50;
//
//   print(hero.hp);
//
//   final Random random = Random();
//   final int randomNumber = random.nextInt(10); // 0 ~ 9
//   print(randomNumber);
// }

// 순수 함수
int function1(int x, int y, int z, int a, int b, int c, int d, int e, int f) {
  return x * 2;
}
