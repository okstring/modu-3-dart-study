import '../../assignments/2025-03-14/elegant_cleric.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric Constructor 테스트', () {
    late Cleric? sally;
    late Cleric? tom;
    late Cleric? john;

    test('Cleric - hp, mp 기본값', () {
      sally = Cleric('Sally');

      expect(sally?.hp, equals(50));
      expect(sally?.mp, equals(10));
    });

    test('Cleric - mp만 기본값', () {
      tom = Cleric('tom', hp: 5);

      expect(tom?.hp, equals(5));
      expect(tom?.mp, equals(10));
    });

    test('Cleric - hp만 기본값', () {
      john = Cleric('John', mp: 5);

      expect(john?.hp, equals(50));
      expect(john?.mp, equals(5));
    });

    test('Cleric - 정적변수 테스트', () {
      expect(Cleric.maxHp, 50);
      expect(Cleric.maxMp, 10);
    });
  });
}