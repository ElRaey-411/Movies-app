import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/errors/failure.dart';
import 'package:movies_app/core/resources/const_manager.dart';
import 'package:movies_app/features/movies/data/models/movie_details/detailed_movie.dart';
import '../../../../../core/errors/errors/app_exceptions.dart';
import '../../../../../core/errors/errors/dio_exceptions.dart';
import 'movie_details_data_source.dart';


@Singleton(as: MovieDetailsDataSource)
class MovieDetailsApiDataSource implements MovieDetailsDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: MoviesApiConstant.baseUrl));

  @override
  Future<Either<Failure, DetailedMovie>> getMovies({
    required int movieId,
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
        final movieJson = data["movie"];

        if (movieJson == null) {
          return Left(Failure(message: "Movie details unavailable."));
        }

        final movie = DetailedMovie.fromJson(movieJson);
        return Right(movie);

      } else {
        throw RemoteException(message: "Server error: ${response.statusCode}");
      }

    } on DioException catch (e) {
      return Left(Failure(message: handleDioError(e).message));

    } on AppExceptions catch (e) {
      return Left(Failure(message: e.message));

    } catch (e) {
      return Left(Failure(message: "Unexpected error occurred. Please try again."));
    }
  }
}
