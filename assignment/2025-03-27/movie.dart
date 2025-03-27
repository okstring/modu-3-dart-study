import 'dart:convert';

class Movie {
  String title;
  String director;
  int year;

  Movie({required this.title, required this.director, required this.year});

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'] as String,
      director = json['director'] as String,
      year = json['year'] as int;

  Map<String, dynamic> toJson() => {
    'title': title,
    'director': director,
    'year': year,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          director == other.director &&
          year == other.year;

  @override
  int get hashCode => title.hashCode ^ director.hashCode ^ year.hashCode;
}

Future<Movie> getMovieInfo() async {
  // TODO: 2초동안 기다리는 코드 작성
  await Future.delayed(const Duration(seconds: 2));
  final String jsonString = '''
  {
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }
  ''';

  final json = jsonDecode(jsonString);
  final movie = Movie.fromJson(json);
  return movie;
}