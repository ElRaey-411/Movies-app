import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/errors/failure.dart';
import '../../models/movies/movie.dart';

@lazySingleton
abstract class MoviesDataSource {
 Future<Either<Failure, List<Movie>>> getMovies({int? limit, String? genres,String? queryTerm });

}