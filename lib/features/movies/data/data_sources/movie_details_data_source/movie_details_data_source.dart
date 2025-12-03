import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movies/data/models/movie_details/detailed_movie.dart';

@lazySingleton
abstract class MovieDetailsDataSource {
  Future<Either<String,DetailedMovie>> getMovies({required int movieId});

}