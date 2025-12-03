import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detials_entity.dart';

@lazySingleton
abstract class MovieDetailsRepo{
  Future<Either<String, MovieDetailsEntity>> getMovies({required int movieId});
}