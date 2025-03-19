import 'package:modu_3_dart_study/game/slime.dart';

abstract interface class Attackable {
  // property : 메소드의 일종
  int get damage;

  void attack(Slime slime);
}