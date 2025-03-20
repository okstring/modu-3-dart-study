import 'package:modu_3_dart_study/2025-03-19/book.dart';
import 'package:modu_3_dart_study/2025-03-19/computer.dart';
import 'package:modu_3_dart_study/2025-03-19/tangible_asset.dart';
import 'package:modu_3_dart_study/game/monster.dart';
import 'package:modu_3_dart_study/game/slime.dart';

import '../2025-03-19/asset.dart';
import '../2025-03-19/thing.dart';

abstract interface class Drawable {
  void draw();
}

class Person implements Drawable {
  void sayHello() {
    print('Hello');
  }

  @override
  void draw() {
    print('사람 그림!!!');
  }
}

class Dog implements Drawable {
  void bark() {
    print('멍멍');
  }

  @override
  void draw() {
    print('멍멍이 그림');
  }
}

void main() {
  Slime slime = Slime('A');
  Monster slime2 = Slime('B');
  slime.run();
  slime2.run();

  Drawable person = Person();
  Drawable dog = Dog();

  person.draw();
  dog.draw();

  switch(person) {
    case Person():
      print(person.runtimeType);
      break;
    case Dog():
      print('멍멍이');
      break;
  }


  final List<Thing> things = [
    Book(name: 'name', price: 1000, color: 'color', isbn: 'isbn', weight: 0),
    Computer(
      name: 'name',
      price: 1000,
      color: 'color',
      makerName: 'makerName',
      weight: 0,
    ),
  ];

  Thing thing = Book(
    name: 'name',
    price: 1000,
    color: 'color',
    isbn: 'isbn',
    weight: 0,
  );
  Thing computer = Computer(
    name: 'name',
    price: 1000,
    color: 'color',
    makerName: 'makerName',
    weight: 0,
  );

  TangibleAsset tangibleAsset = Computer(
    name: 'name',
    price: 1000,
    color: 'color',
    makerName: 'makerName',
    weight: 0,
  );

  Asset computer2 = Computer(
    name: 'name',
    price: 1000,
    color: 'color',
    makerName: 'makerName',
    weight: 0,
  );
}
