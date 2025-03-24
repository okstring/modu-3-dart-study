class StrongBox<E> {
  E? _data;
  KeyType type;
  int _openCount;

  StrongBox({
    required this.type,
    required E? data,
  }) : _data = data, _openCount = 0;

  void put(E data) {
    _data = data;
  }

  E? get() {
    _openCount += 1;
    if (_openCount > type.openCountLimit) {
      return _data;
    } else {
      return null;
    }
  }
}

enum KeyType {
  padlock,
  button,
  dial,
  finger;

  int get openCountLimit {
    switch (this) {
      case KeyType.padlock:
        return 1_024;
      case KeyType.button:
        return 10_000;
      case KeyType.dial:
        return 30_000;
      case KeyType.finger:
        return 1_000_000;
    }
  }
}