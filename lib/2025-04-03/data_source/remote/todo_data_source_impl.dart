import 'dart:convert';

import 'package:http/http.dart' as http;

import '../todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client client;
  static const todosUrlString = 'https://jsonplaceholder.typicode.com/todos';
  static todoUrlString(int id) => 'https://jsonplaceholder.typicode.com/todos/$id';

  TodoDataSourceImpl(this.client);

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final response = await client.get(Uri.parse(todosUrlString));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => Map<String, dynamic>.from(e)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<Map<String, dynamic>> getTodo(int id) async {
    final response = await client.get(Uri.parse(todoUrlString(id)));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load todo');
    }
  }
}
