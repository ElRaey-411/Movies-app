import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/movie_details_use_case.dart';
import 'cubit_states.dart';


@lazySingleton
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsUseCase movieDetailsUseCase;

  MovieDetailsCubit({
    required this.movieDetailsUseCase,
  }) : super(MovieDetailsInitial());

  Future<void> fetchMovie({required int movieId}) async {
    emit(MovieDetailsLoading());
    final result = await movieDetailsUseCase(movieId: movieId);
    result.fold(
          (failure) => emit(MovieDetailsOnError(failure)),
          (movies) => emit(MovieDetailsOnSuccess(movies)),
    );
  }


}
