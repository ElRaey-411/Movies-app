import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movies/domain/repos/movie_suggestions_repo.dart';
import '../entities/movie_summary_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieSuggestionsUseCase {
  final MovieSuggestionsRepo movieSuggestionsRepo;
  MovieSuggestionsUseCase({required this.movieSuggestionsRepo});

  Future<Either<String, List<MovieSummaryEntity>>> call({required int movieId}) async {
    return await movieSuggestionsRepo.getMovies(
      movieId: movieId,
    );
  }
}