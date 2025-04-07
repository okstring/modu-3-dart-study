import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/error/registration_error.dart';

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  int _userId = 0;

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) {
    return Future.value(
      UserDto(
        id: _userId++,
        email: email,
        password: password,
        createdAt: DateTime.now().toIso8601String(),
      ),
    );
  }
}
