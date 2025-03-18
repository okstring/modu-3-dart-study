import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/slime.dart';
import '../../assignments/2025-03-18/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  group('Slime 테스트', () {
    test('Slime은 attack 시 hero 체력이 닳아야 한다.', () {
      final slime = Slime('-mini');
      const hp = 100;
      const count = 10;
      final hero = Hero(name: '홍길동', hp: hp);

      for (int i = 0; i < count; i++) {
        slime.attack(hero);
      }

      expect(hero.hp, hp - Slime.attackDamage * count);

      slime.attack(hero);

      expect(hero.hp, 0);
    });

    test('Slime은 hp가 0 이하로 떨어지지 않는다.', () {
      final slime = Slime('-mini');
      const hp = 0;
      final hero = Hero(name: '홍길동', hp: hp);

      slime.attack(hero);

      expect(hero.hp, 0);
    });
  });

  group('Poison Slime 테스트', () {
    test('Poison Slime은 Slime 자식 클래스다', () {
      final slime = PoisonSlime('-mini');
      expect(slime, isA<Slime>());
    });

    test('Poison Slime은 독 공격 시 추가로 hp를 1/5 감소시킨다', () {
      final poisonSlime = PoisonSlime('-mini');
      const hp = 100;
      final hero = Hero(name: '홍길동', hp: hp);

      poisonSlime.attack(hero);

      expect(hero.hp, hp - Slime.attackDamage - ((hp - Slime.attackDamage) * 0.2));
    });
  });

  // group('Poison Slime 테스트', () {
    // test('이름은 3자 이상 되어야 한다.', () {
    //   const name = 'stick';
    //
    //   final stick = Wand(name, 50.0);
    //
    //   expect(stick.name.length, greaterThanOrEqualTo(3));
    // });
    //
    // test('유효하지 않은 이름에 대한 메세지가 똑같아야 한다. ', () {
    //   const name = 'H';
    //
    //   Wand wand;
    //
    //   expect(() {
    //     wand = Wand(name, 0.0);
    //   } , throwsA((e) => e is CustomException && e.message == TaskException.invalidName.message));
    // });
  // });
}