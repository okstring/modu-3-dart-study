import 'package:modu_3_dart_study/2025-03-31/todo.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/todo_repository.dart';

import '../data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource;

  TodoRepositoryImpl({required this.todoDataSource});

  @override
  Future<Todo> getTodo(int id) async {
    final json = await todoDataSource.getTodo(id);
    return Todo.fromJson(json);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final jsonList = await todoDataSource.getTodos();
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }
}