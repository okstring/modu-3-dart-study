import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  UserDto returnUserDto;

  MockAuthRemoteDataSourceImpl({required this.returnUserDto});

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    return await Future.value(returnUserDto);
  }
}
