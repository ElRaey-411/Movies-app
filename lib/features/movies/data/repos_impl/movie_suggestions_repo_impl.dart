import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movies/data/data_sources/movie_suggestions_data_source/movie_suggestions_data_source.dart';
import 'package:movies_app/features/movies/domain/entities/movie_summary_entity.dart';
import '../../../../core/errors/errors/failure.dart';
import '../../domain/repos/movie_suggestions_repo.dart';

@Singleton(as: MovieSuggestionsRepo)
class MovieSuggestionsRepoImpl implements MovieSuggestionsRepo {
  MovieSuggestionsRepoImpl({required this.dataSource});

  final MovieSuggestionsDataSource dataSource;

  @override
  Future<Either<Failure, List<MovieSummaryEntity>>> getMovies({
    required int movieId,
  }) async {
    try {
      final result = await dataSource.getMovies(
        movieId: movieId,
      );
      return result.fold(
            (failure) => Left(failure),
            (movies) =>
            Right(movies.map((movie) => movie.toMovieSummaryEntity()).toList()),
      );
    } catch (e) {
      return Left(Failure(
          message: "Unexpected error occurred: ${e.toString()}"
      ));
    }
  }
}
