import '../../assignments/2025-03-17/wizard.dart';
import '../../assignments/2025-03-17/wand.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard 테스트', () {
    test('이름은 3자 이상 되어야 한다.', () {
      const name = 'Han';

      final han = Wizard(name, 0, 0);

      expect(han.name.length, greaterThanOrEqualTo(3));
    });

    test('MP는 0 이상 되어야 한다.', () {
      const mp = 0;

      final han = Wizard('Han', 0, mp);

      expect(han.mp, greaterThanOrEqualTo(0));
    });

    test('HP는 음수가 되는 상황에서는 0으로 되어야 한다.', () {
      final han = Wizard('Han', 100, 0);

      han.hp -= 150;

      expect(han.hp, greaterThanOrEqualTo(0));
    });
  });

  group('Wand 테스트', () {
    test('이름은 3자 이상 되어야 한다.', () {
      const name = 'stick';

      final stick = Wand(name, 50.0);

      expect(stick.name.length, greaterThanOrEqualTo(3));
    });

    test('지팡이 마력은 0.5 이상, 100.0 이하 되어야 한다.', () {
      final stick = Wand('Foo', 0.5);
      final stickB = Wand('Bar', 0.5);
      const double power = 0.5;
      const double powerB = 100.0;

      stick.power = power;
      stickB.power = powerB;

      expect(stick.power, equals(0.5));
      expect(stickB.power, equals(100.0));
    });
  });
}