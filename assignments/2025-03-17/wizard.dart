import 'wand.dart';
import 'dart:math';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  String get name => _name;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('❎이름은 3자 이상이어야 합니다.');
    }
    _name = value;
  }

  int get hp => _hp;

  set hp(int value) {
    _hp = max(0, value);
  }

  int get mp => _mp;

  set mp(int value) {
    if (value < 0) {
      throw Exception('❎마법사의 MP는 0 이상이어야 합니다.');
    }
    _mp = value;
  }

  Wand? get wand => _wand;

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('❎지팡이를 없앨 순 없습니다.');
    }
    _wand = value;
  }

  Wizard(String name, int hp, int mp, {Wand? wand})
    : _name = name,
      _hp = max(0, hp),
      _mp = mp,
      _wand = wand {
    if (name.length < 3) {
      throw Exception('❎이름은 3자 이상이어야 합니다.');
    }

    if (mp < 0) {
      throw Exception('❎마법사의 MP는 0 이상이어야 합니다.');
    }
  }
}

main() {}
