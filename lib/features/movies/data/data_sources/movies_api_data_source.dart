import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/resources/const_manager.dart';
import '../models/movie.dart';
import 'movies_data_source.dart';

class MoviesApiDataSource implements MoviesDataSource {
  final Dio dio;
  MoviesApiDataSource({required this.dio});
  @override
  Future<Either<String, List<Movie>>> getMovies({int? limit, String? genre}) async {
    try {
      final response = await dio.get(MoviesApiConstant.baseUrl+MoviesApiConstant.moviesListEndPoint,
        queryParameters: {
          'limit': limit,
          'genre': genre,
        },);
      if (response.statusCode == 200) {
        final data = response.data['data'];
        final movies = (data['movies'] as List)
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
