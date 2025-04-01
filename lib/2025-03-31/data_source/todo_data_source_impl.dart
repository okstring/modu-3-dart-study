import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final File _todoFile = File(
    '/Users/junsuk/dev/FlutterProjects/modu-3-dart-study/lib/2025-03-31/todo.json',
  );

  final File _todosFile = File(
    '/Users/junsuk/dev/FlutterProjects/modu-3-dart-study/lib/2025-03-31/todos.json',
  );

  @override
  Future<Todo> getTodo() async {
    final String jsonString = await _todoFile.readAsString();

    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Todo.fromJson(json);
  }

  void save() {

  }

  // @override
  // Future<List<Todo>> getTodos() async {
  //   final String jsonString = await _todosFile.readAsString();
  //   final List<dynamic> json1 = jsonDecode(jsonString);
  //   final List<Map<String, dynamic>> json2 = json1.map((dynamic e) => e as Map<String, dynamic>).toList();
  //   final List<Todo> json3 = json2.map((Map<String, dynamic> e) => Todo.fromJson(e)).toList();
  //
  //   return json3;
  // }

  @override
  Future<List<Todo>> getTodos() async {
    final String jsonString = await _todosFile.readAsString();

    final List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }
}
