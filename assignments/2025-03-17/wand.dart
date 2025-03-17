class Wand {
  String _name;

  String get name => _name;

  set name(String value) {
    _validateName(value);
    _name = value;
  }

  double _power;

  double get power => _power;

  set power(double value) {
    _validatePower(value);
    _power = value;
  }

  Wand(String name, double power) : _name = name, _power = power {
    _validateName(name);
    _validatePower(power);
  }

  void _validateName(String name) {
    if (name.length < 3) {
      throw Exception('❎이름은 3자 이상이어야 합니다.');
    }
  }

  void _validatePower(double power) {
    if (power < 0.5 || power > 100.0) {
      throw Exception('❎지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.');
    }
  }
}
