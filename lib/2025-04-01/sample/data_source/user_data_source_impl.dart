import 'dart:convert';

import 'package:modu_3_dart_study/2025-04-01/sample/data_source/user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    String jsonString = '''[
    {},
    {},
    ]''';

    final List users = jsonDecode(jsonString);
    return users.map((e) => e as Map<String, dynamic>).toList();
  }
}