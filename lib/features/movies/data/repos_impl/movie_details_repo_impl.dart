import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/movie_detials_entity.dart';
import '../../domain/repos/movie_details_repo.dart';
import '../data_sources/movie_details_data_source/movie_details_data_source.dart';

@Singleton(as: MovieDetailsRepo)
class MoviesDetailsRepoImpl implements MovieDetailsRepo {
  MoviesDetailsRepoImpl({required this.dataSource});

  final MovieDetailsDataSource dataSource;

  @override
  Future<Either<String, MovieDetailsEntity>> getMovies({
   required int movieId,
  }) async {
    try {
      final result = await dataSource.getMovies(
        movieId: movieId,
      );
      return result.fold(
            (failure) => Left(failure),
            (movie) =>
            Right(movie.toMovieDetailsEntity()),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
