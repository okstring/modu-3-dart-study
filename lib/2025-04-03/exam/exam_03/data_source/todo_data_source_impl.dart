import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client _client;

  const TodoDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<Todo> getTodo(int id) async {
    final response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load todo');
    } else {
      final json = jsonDecode(response.body);
      return Todo.fromJson(json);
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    final response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load todo');
    } else {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Todo.fromJson(e)).toList();
    }
  }
}
