import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/movie_summary_entity.dart';
import '../repos/movies_repo.dart';

@lazySingleton
class BrowseUseCase {
  final MoviesRepo moviesRepo;
  BrowseUseCase({required this.moviesRepo});

  Future<Either<String, List<MovieSummaryEntity>>> call({
    String? genres,
  }) async {
    return await moviesRepo.getMovies(genre: genres);
  }
}
