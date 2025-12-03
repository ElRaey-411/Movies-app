import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/movie_suggestions_use_case.dart';
import 'cubit_states.dart';


@lazySingleton
class MovieSuggestionsCubit extends Cubit<MovieSuggestionsState> {
  final MovieSuggestionsUseCase movieSuggestionsUseCase;

  MovieSuggestionsCubit({
    required this.movieSuggestionsUseCase,
  }) : super(MovieSuggestionsInitial());

  Future<void> fetchMovies({required int movieId}) async {
    emit(MovieSuggestionsLoading());
    final result = await movieSuggestionsUseCase(movieId: movieId);
    result.fold(
          (failure) => emit(MovieSuggestionsOnError(failure)),
          (movies) => emit(MovieSuggestionsOnSuccess(movies)),
    );
  }


}

