Future<void> main() async {
  Movie movie = await getMovieInfo();

  print(movie.director);
}

Future<Movie> getMovieInfo() async {
  print('데이터 로드');

  await Future.delayed(Duration(seconds: 2));

  // String json = jsonDecode(jsonString)

  final Map<String, dynamic> json = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1977,
  };

  print('데이터 로드 끝');
  return Movie.fromJson(json);
}

class Movie {
  final String title;
  final String director;
  final int year;

  Movie({required this.title, required this.director, required this.year});

  // named constructor
  // Movie.fromJson(Map<String, dynamic> json)
  //     : title = json['title'] as String,
  //       director = json['director'] as String,
  //       year = json['year'] as int;

  factory Movie.fromJson(Map<String, dynamic> json) {
    // 온갖 로직
    final String title = json['title'] ?? '제목 없음';

    return Movie(
      title: title,
      director: json['director'] as String,
      year: json['year'] as int,
    );
  }

  @override
  String toString() {
    return 'Movie{title: $title, director: $director, year: $year}';
  }
}
