import '../model/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo(int id);

  Future<List<Todo>> getTodos();
}
