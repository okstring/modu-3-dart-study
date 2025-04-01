import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../../assignment/2025-04-01/model/user.dart';

void main() {
  const List<Map<String, dynamic>> mockUsers = [
    {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
  ];

  group('Users 테스트', () {
    test('직렬화, 역직렬화 테스트', () {
      final users = mockUsers.map((e) => User.fromJson(e)).toList();
      final jsonList = users.map((e) => e.toJson()).toList();
      final deserializationUsers =
          jsonList.map((e) => User.fromJson(e)).toList();

      expect(ListEquality().equals(users, deserializationUsers), isTrue);
    });
  });
}
