import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/errors/failure.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detials_entity.dart';

@lazySingleton
abstract class MovieDetailsRepo{
  Future<Either<Failure, MovieDetailsEntity>> getMovies({required int movieId});
}