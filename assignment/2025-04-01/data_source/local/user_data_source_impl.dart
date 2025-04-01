import 'dart:convert';
import 'dart:io';

import '../user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchUsers(String path) async {
    final jsonString = await File(path).readAsString();
    return jsonDecode(jsonString) as List<Map<String, dynamic>>;
  }
}
