
import '../../../../../domain/entities/movie_summary_entity.dart';

abstract class HomeTabCarouselState {}

class HomeTabCarouselInitial extends HomeTabCarouselState {}

class HomeTabCarouselLoading extends HomeTabCarouselState {}

class HomeTabCarouselOnError extends HomeTabCarouselState {
  final String message;

  HomeTabCarouselOnError(this.message);
}

class HomeTabCarouselOnSuccess extends HomeTabCarouselState {
  final List<MovieSummaryEntity> movies;

  HomeTabCarouselOnSuccess(this.movies);
}
//============================================
abstract class HomeTabCategoryState {}
class HomeTabCategoryInitial extends HomeTabCategoryState {}
class HomeTabCategoryLoading extends HomeTabCategoryState {}
class HomeTabCategoryOnError extends HomeTabCategoryState {
  final String message;

  HomeTabCategoryOnError(this.message);
}
class HomeTabCategoryOnSuccess extends HomeTabCategoryState {
  final List<MovieSummaryEntity> category1;
  final List<MovieSummaryEntity> category2;
  final List<MovieSummaryEntity> category3;
  HomeTabCategoryOnSuccess(this.category1, this.category2, this.category3);
}