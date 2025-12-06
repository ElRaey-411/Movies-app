import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/errors/failure.dart';
import '../../models/movies/movie.dart';

@lazySingleton
abstract class MovieSuggestionsDataSource {
  Future<Either<Failure, List<Movie>>> getMovies({required int movieId});

}