import 'package:modu_3_dart_study/2025-03-19/computer.dart';
import 'package:modu_3_dart_study/2025-03-19/tangible_asset.dart';

void main() {
  List list = []; // List<dynamic>

  Pocket<Computer> pocket = Pocket();
  pocket.put(
    Computer(
      name: 'name',
      price: 100,
      color: 'color',
      makerName: 'makerName',
      weight: 10,
    ),
  );

  final Computer? data = pocket.get();
  print(data ?? '값 없음');
}

class Pocket<E extends TangibleAsset> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  E? get() {
    return _data;
  }
}

// ver1
// class Pocket {
//   Object? _data;
//
//   void put(Object data) {
//     _data = data;
//   }
//
//   Object? get() {
//     return _data;
//   }
// }
