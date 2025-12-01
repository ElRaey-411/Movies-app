import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/browse_tab/browse_tab.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/home_tab/presentation/cubits/home_tab_category_cubit.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/home_tab/presentation/home_tab.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/home_tab/presentation/cubits/home_tab_carousel_cubit.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/profile_tab/profile_tab.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/search_tab/search_tab.dart';
import '../../data/data_sources/movies_api_data_source.dart';
import '../../data/repos_impl/movies_repo_impl.dart';
import '../../domain/use_cases/carousel_movies_use_case.dart';
import '../../domain/use_cases/home_tab_categorise_use_case.dart';

class MainLayoutProvider extends ChangeNotifier {
  int selectedTab = 0;
  int selectedGenre = 0;
  int selectedCarouselTab = 0;
  List<String> genres = [
    'Sport',
    'Romance',
    'Animation',
    'Adventure',
    'Anime',
    'Comedy',
    'Crime',
    'Documentary',
    'Action',
    'Drama',
    'Family',
    'Fantasy',
    'Game Show',
    'Horror',
    'Language',
    'Lifestyle',
    'Musical',
    'Mystery',
    'Sci-Fi',
    'Seasonal',
    'Short',
    'Reality TV'
    'Thriller',
    'Western',
    'Music',
  ];

  late List<Widget> tabs = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeTabCarouselCubit(
            carouselMoviesUseCase: CarouselMoviesUseCase(
              moviesRepo: MoviesRepoImpl(
                dataSource: MoviesApiDataSource(dio: Dio()),
              ),
            ),
          )..fetchCarouselMovies(
            limit: 5,
          ),
        ),
        BlocProvider(
          create: (context) => HomeTabCategoryCubit(
            homeTabCategoriseUseCase: HomeTabCategoriseUseCase(
              moviesRepo: MoviesRepoImpl(
                dataSource: MoviesApiDataSource(dio: Dio()),
              ),
            ),
          )..fetchCategoryMovies(
            genre1: genres[selectedGenre],
            genre2: genres[selectedGenre+1],
            genre3: genres[selectedGenre+2],
          ),
        ),
      ],
      child: HomeTab(),
    ),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  void changeGenre(int index) {
   if(selectedTab == 0){
   if(selectedGenre!=21){
     selectedGenre+=3;
   }else if (selectedGenre==21){
     selectedGenre=0;
   }
   notifyListeners();}
  }


  void changeTab(int index) {
    changeGenre(index);
    selectedTab = index;
    notifyListeners();
  }

  void onCarouselChange(int index) {
    selectedCarouselTab = index;
    notifyListeners();
  }
}


