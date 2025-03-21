import 'package:modu_3_dart_study/game/cleric.dart';

import '../game/character.dart';

void main() {

  Object object = Object();
  Hero hero = Hero(name: 'name', hp: 100);

  Cleric cleric1 = Cleric('성직자');
  Cleric cleric2 = Cleric('성직자');

  // int num1 = 100;
  // int num2 = 100;
  // print(num1.hashCode);
  // print(num2.hashCode);
  // print(num1 == num2);

  print(cleric1.hashCode);
  print(cleric2.hashCode);

  // 동등성 비교 룰을 재정의 해서 내용이 같으면 같은 걸로 보게 되었음
  print(cleric1 == cleric2);  // true


  print(cleric1);

  final List<Cleric> heroes = [];
  heroes.add(cleric1);
  heroes.remove(cleric2);

  print(heroes.length); // 1

  object = hero;
}

class A extends Object {

}