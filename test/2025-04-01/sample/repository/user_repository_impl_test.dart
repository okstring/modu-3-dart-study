
import 'dart:convert';

import 'package:modu_3_dart_study/2025-04-01/sample/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/sample/repository/user_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/sample/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import '../mock/mock_user_data_source_impl.dart';

void main() {
  test('', () async {
    UserRepository userRepository = UserRepositoryImpl(MockUserDataSourceImpl());

    final users = await userRepository.getUsers();

    expect(users.length, 2);
    expect(users[0].name, '한석봉');
  });
}