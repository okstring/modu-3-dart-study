import 'task_exception.dart';
import 'wand.dart';
import '../2025-03-18/hero.dart';
import 'dart:math';

class Wizard {
  static const healMpCost = 10;
  static const noMpMsg = '마나가 부족합니다';
  static casingHealMsg(int hp) => '힐을 시전했습니다. 대상 HP: $hp';

  String _name;
  int _hp;
  int _mp = 100;
  Wand? _wand;

  String get name => _name;

  set name(String value) {
    _validateName(value);
    _name = value;
  }

  int get hp => _hp;

  set hp(int value) {
    _hp = max(0, value);
  }

  int get mp => _mp;

  set mp(int value) {
    _validateMp(value);
    _mp = value;
  }

  Wand? get wand => _wand;

  set wand(Wand? value) {
    _validateWand(value);
    _wand = value;
  }

  Wizard(String name, int hp, {Wand? wand})
    : _name = name,
      _hp = max(0, hp),
      _wand = wand {
    _validateName(name);
  }

  void heal(Hero hero) {
    if (mp < Wizard.healMpCost) {
      print(Wizard.noMpMsg);
    } else {
      hero.hp += 20;
      mp -= 10;
      print(Wizard.casingHealMsg(hero.hp));
    }
  }

  void _validateName(String name) {
    if (name.length < 3) {
      throw TaskException.invalidName;
    }
  }

  void _validateMp(int mp) {
    if (mp < 0) {
      throw TaskException.invalidMp;
    }
  }

  void _validateWand(Wand? wand) {
    if (wand == null) {
      throw TaskException.invalidWand;
    }
    this.wand = wand;
  }
}

main() {}
