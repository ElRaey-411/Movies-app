import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/resources/const_manager.dart';
import 'package:movies_app/features/movies/data/models/movie_details/detailed_movie.dart';
import 'movie_details_data_source.dart';


@Singleton(as: MovieDetailsDataSource)
class MovieDetailsApiDataSource implements MovieDetailsDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: MoviesApiConstant.baseUrl));

  @override
  Future<Either<String, DetailedMovie>> getMovies({
    required int movieId
  }) async {
    try {
      final response = await dio.get(
        MoviesApiConstant.movieDetailsEndPoint,
        queryParameters: {
          'movie_id': movieId,
          'with_images': true,
          'with_cast': true,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];
        final movie = DetailedMovie.fromJson(data["movie"]);
        return Right(movie);
      } else {
        if (response.statusCode == 404) {
          return Left('Movie not found');
        } else {
          return Left('Server Error: ${response.statusCode}');
      }
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
