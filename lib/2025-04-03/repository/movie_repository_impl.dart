import '../data_source/movie_data_source.dart';
import '../model/movieList.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  const MovieRepositoryImpl({required this.movieDataSource});

  @override
  Future<MovieList> getMovieInfoList() async {
    final json = await movieDataSource.getUpcomingMovies();
    return MovieList.fromJson(json);
  }
}
