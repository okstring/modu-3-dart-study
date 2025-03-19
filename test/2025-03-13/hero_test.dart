import 'package:modu_3_dart_study/game/character.dart';
import 'package:modu_3_dart_study/game/slime.dart';
import 'package:test/test.dart';

void main() {
  test('Hero attack 테스트', () {
    // 준비
    Hero hero = Hero(name: '홍길동', hp: 100);

    // 실행
    hero.attack(Slime('A'));

    // 검증
    expect(hero.hp, equals(95));
  });

  test('Hero 테스트', () {
    // 준비
    Hero hero = Hero(name: '홍길동', hp: 50);

    // 실행
    hero.sleep();

    // 검증
    expect(hero.hp, equals(100));
  });
}