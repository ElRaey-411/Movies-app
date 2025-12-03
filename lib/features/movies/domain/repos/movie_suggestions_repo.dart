import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movies/domain/entities/movie_summary_entity.dart';

@lazySingleton
abstract class MovieSuggestionsRepo{
  Future<Either<String, List<MovieSummaryEntity>>> getMovies({required int movieId});
}