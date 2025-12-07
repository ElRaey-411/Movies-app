import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/profile_tab/domain/repo/watch_list_repo.dart';

import '../../../../../../../../core/errors/errors/failure.dart';
import '../../../../../../domain/entities/movie_summary_entity.dart';

@lazySingleton
class GetWatchListMoviesUseCase {
  WatchListRepo watchListRepo;
  GetWatchListMoviesUseCase({required this.watchListRepo});

  Future<Either<Failure, List<MovieSummaryEntity>>> call() async {
    return await watchListRepo.getWatchListMovies();
  }
}