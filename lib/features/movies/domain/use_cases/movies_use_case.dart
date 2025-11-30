import 'package:dartz/dartz.dart';
import '../entities/movie_summary_entity.dart';
import '../repos/movies_repo.dart';

class MoviesUseCase {
  final MoviesRepo moviesRepo;
  MoviesUseCase({required this.moviesRepo});

  Future<Either<String, List<MovieSummaryEntity>>> call(
      {int? limit}
      ) async {
    return await moviesRepo.getMovies(limit: limit);
  }
}