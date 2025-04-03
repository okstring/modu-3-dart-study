import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/remote/movie_data_source_impl.dart';

class MockHttpClientImpl {
  static const Map<String, List<Map<String, dynamic>>> body = {
    "results": [
      {
        "id": 939243,
        "title": "수퍼 소닉 3",
        "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
        "release_date": "2024-12-19",
      },
    ],
  };

  final mockClient = MockClient((request) async {
    if (request.url.toString() == MovieDataSourceImpl.urlString) {
      return http.Response.bytes(utf8.encode(jsonEncode(body)), 200);
    } else {
      return http.Response('Not Found', 404);
    }
  });
}
