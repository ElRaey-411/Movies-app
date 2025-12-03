import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/resources/const_manager.dart';
import '../../models/movies/movie.dart';
import 'movie_suggestions_data_source.dart';

@Singleton(as: MovieSuggestionsDataSource)
class MovieSuggestionsApiDataSource implements MovieSuggestionsDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: MoviesApiConstant.baseUrl));

  @override
  Future<Either<String, List<Movie>>> getMovies({
required int movieId,
  }) async {
    try {
      final response = await dio.get(
        MoviesApiConstant.moviesSuggestionsEndPoint,
        queryParameters: {
          'movie_id': movieId,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];
        final moviesList = data['movies'];
        if (moviesList == null) {
          return Right([]);
        }

        final movies = (moviesList as List)
            .map((json) => Movie.fromJson(json))
            .toList();

        return Right(movies);
      } else {
        return Left('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
