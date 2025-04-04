import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_03/data_source/todo_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  final mockClient = MockClient((request) async {
    if (request.url.toString() ==
        'https://jsonplaceholder.typicode.com/todos') {
      return http.Response(
        jsonEncode([
          {"id": 1, "title": "Todo 1", "completed": false, "userId": 0},
          {"id": 2, "title": "Todo 2", "completed": true, "userId": 1},
        ]),
        200,
      );
    }

    if (request.url.toString() ==
        'https://jsonplaceholder.typicode.com/todos/1') {
      return http.Response(
        jsonEncode({"id": 1, "title": "Todo 1", "completed": false, "userId": 1}),
        200,
      );
    }

    if (request.url.toString() ==
        'https://jsonplaceholder.typicode.com/todos/100') {
      throw Exception('Network Error');
    }

    if (request.url.toString() ==
        'https://jsonplaceholder.typicode.com/todos/200') {
      return http.Response(jsonEncode({'message': 'Not Found'}), 404);
    }

    return http.Response('테스터가 잘못했어', 500);
  });
  final TodoDataSource dataSource = TodoDataSourceImpl(client: mockClient);

  test('1. getTodos 성공 케이스', ()  async {
    final todos = await dataSource.getTodos();

    expect(todos.length, 2);
    expect(todos[0].title, 'Todo 1');
    expect(todos[0].completed, false);
  });

  test('2. getTodo 성공 케이스', ()  async {
    final todo = await dataSource.getTodo(1);

    expect(todo.title, 'Todo 1');
  });

  test('3. 네트워크 에러 케이스', ()  async {
    expect(() async => await dataSource.getTodo(100), throwsException);
  });

  test('4. 존재하지 않는 ID 요청 케이스', ()  async {
    expect(() async => await dataSource.getTodo(200), throwsException);
  });
}
