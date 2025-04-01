import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  final File _usersFile = File(
    '/Users/junsuk/dev/FlutterProjects/modu-3-dart-study/lib/2025-03-31/users.json',
  );

  @override
  Future<List<User>> getUsers() async {
    final String jsonString = await _usersFile.readAsString();

    final List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => User.fromJson(e)).toList();
  }

}