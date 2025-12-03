import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detials_entity.dart';
import '../repos/movie_details_repo.dart';

@lazySingleton
class MovieDetailsUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  MovieDetailsUseCase(this.movieDetailsRepo,);

  Future<Either<String, MovieDetailsEntity>> call({required int movieId}
      ) async {
    return await movieDetailsRepo.getMovies(movieId: movieId);
  }
}