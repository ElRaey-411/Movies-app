import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../models/movies/movie.dart';

@lazySingleton
abstract class MoviesDataSource {
 Future<Either<String, List<Movie>>> getMovies({int? limit, String? genres,String? queryTerm });

}