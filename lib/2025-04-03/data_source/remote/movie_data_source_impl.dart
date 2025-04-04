import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/config/api_config.dart';

import '../movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client client;

  MovieDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> getUpcomingMovies() async {
    final response = await client.get(Uri.parse(ApiConfig.movieUrlString()));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
