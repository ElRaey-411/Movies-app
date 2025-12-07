import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movies/domain/entities/movie_summary_entity.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(super.initialState);

}

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryError extends HistoryState {
  final String message;
  HistoryError({required this.message});
}

class HistorySuccess extends HistoryState {
  final List<MovieSummaryEntity> movies;
  HistorySuccess({required this.movies});
}
