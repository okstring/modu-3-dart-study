import 'dart:convert';

import 'package:http/http.dart' as http;

import '../movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client client;
  static const urlString =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';

  MovieDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> getUpcomingMovies() async {
    final response = await client.get(Uri.parse(urlString));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
