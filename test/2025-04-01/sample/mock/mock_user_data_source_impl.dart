import 'package:modu_3_dart_study/2025-04-01/sample/data_source/user_data_source.dart';

class MockUserDataSourceImpl implements UserDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    return [
      {
        'id': 1,
        'name': '홍길동',
      },
      {
        'id': 2,
        'name': '한석길동',
      },
    ];
  }

}