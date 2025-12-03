import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../models/movies/movie.dart';

@lazySingleton
abstract class MovieSuggestionsDataSource {
  Future<Either<String, List<Movie>>> getMovies({required int movieId});

}