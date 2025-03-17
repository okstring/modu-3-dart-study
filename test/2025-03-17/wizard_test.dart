import '../../assignments/2025-03-17/taskError.dart';
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

    test('유효하지 않은 이름에 대한 메세지가 똑같아야 한다. ', () {
      const name = 'H';

      Wizard wizard;

      expect(() {
        wizard = Wizard(name, 0, 0);
      } , throwsA((e) => e is CustomException && e.message == TaskError.invalidName.message));
    });

    test('MP는 0 이상 되어야 한다.', () {
      const mp = 0;

      final han = Wizard('Han', 0, mp);

      expect(han.mp, greaterThanOrEqualTo(0));
    });

    test('유효하지 않은 MP에 대한 메세지가 똑같아야 한다. ', () {
      const mp = -100;

      Wizard wizard;

      expect(() {
        wizard = Wizard('foo', 0, mp);
      } , throwsA((e) => e is CustomException && e.message == TaskError.invalidMp.message));
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

    test('유효하지 않은 이름에 대한 메세지가 똑같아야 한다. ', () {
      const name = 'H';

      Wand wand;

      expect(() {
        wand = Wand(name, 0.0);
      } , throwsA((e) => e is CustomException && e.message == TaskError.invalidName.message));
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

    test('유효하지 않은 마력에 대한 메세지가 똑같아야 한다. ', () {
      const double power = 101.1;

      Wand wand;

      expect(() {
        wand = Wand('foo', power);
      } , throwsA((e) => e is CustomException && e.message == TaskError.invalidPower.message));
    });
  });
}