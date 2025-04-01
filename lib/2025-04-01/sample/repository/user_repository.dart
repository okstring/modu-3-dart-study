import '../../../2025-03-31/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();

  Future<User> getUser(int id);
}
