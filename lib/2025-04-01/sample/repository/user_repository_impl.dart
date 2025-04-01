import 'package:modu_3_dart_study/2025-03-31/model/user.dart';
import 'package:modu_3_dart_study/2025-04-01/sample/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/sample/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  const UserRepositoryImpl(this._userDataSource);

  @override
  Future<User> getUser(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }


}