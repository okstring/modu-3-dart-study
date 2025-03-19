import 'package:modu_3_dart_study/2025-03-19/index.dart';
import 'package:test/test.dart';

void main() {
  group('Computer Teset', () {
    const String makerName = '가힣';
    const double weight = 0.0;
    const int price = 100;
    const String color = 'red';
    final DateTime purchaseDate = DateTime(2025, 3, 1);
    const String name = 'test';
    final DateTime createdDate = DateTime(2025, 1, 31);
    const String manageDepart = '관리부';
    const String description = '설명입니다.';

    test('인스턴스 생성 시 값이 제대로 들어가야 한다.', () {
      final computer = Computer(
        makerName: makerName,
        weight: weight,
        price: price,
        color: color,
        purchaseDate: purchaseDate,
        name: name,
        createdDate: createdDate,
        manageDepart: manageDepart,
        description: description,
      );

      expect(makerName, equals(computer.makerName));
      expect(weight, equals(computer.weight));
      expect(price, equals(computer.price));
      expect(color, equals(computer.color));
      expect(purchaseDate, equals(computer.purchaseDate));
      expect(name, equals(computer.name));
      expect(createdDate, equals(computer.createdDate));
      expect(manageDepart, equals(computer.manageDepart));
      expect(description, equals(computer.description));
    });

    test('상속, 구현 단계가 올바라야 한다.', () {
      final computer = Computer(
        makerName: makerName,
        weight: weight,
        price: price,
        color: color,
        purchaseDate: purchaseDate,
        name: name,
        createdDate: createdDate,
        manageDepart: manageDepart,
        description: description,
      );

      expect(computer, isA<Book>());
      expect(computer, isA<Thing>());
      expect(computer, isA<TangibleAsset>());
      expect(computer, isA<Asset>());
    });

    test('weight 값이 제대로 바뀌어야 한다', () {
      final computer = Computer(
        makerName: makerName,
        weight: weight,
        price: price,
        color: color,
        purchaseDate: purchaseDate,
        name: name,
        createdDate: createdDate,
        manageDepart: manageDepart,
        description: description,
      );

      const newWeight = 150.0;
      computer.weight = newWeight;

      expect(newWeight, computer.weight);
    });

    test('세금 계산이 제대로 되어야 한다.', () {
      final computer = Computer(
        makerName: makerName,
        weight: weight,
        price: price,
        color: color,
        purchaseDate: purchaseDate,
        name: name,
        createdDate: createdDate,
        manageDepart: manageDepart,
        description: description,
      );

      final tax = computer.calculateTax();

      expect(
        tax,
        (computer.price * TangibleAsset.taxRate).toInt() +
            (computer.price * Computer.taxRate),
      );
    });

    test('감가상각비 계산이 정확해야 한다.', () {
      final computer = Computer(
        makerName: makerName,
        weight: weight,
        price: price,
        color: color,
        purchaseDate: purchaseDate,
        name: name,
        createdDate: createdDate,
        manageDepart: manageDepart,
        description: description,
      );

      final depreAndAmort = computer.depreAndAmort();

      expect(depreAndAmort, price * 0.7);
    });
  });
}
