import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/movie_gradient.dart';
import 'package:movies_app/core/widgets/movie_item.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/home_tab/presentation/home_tab_cubit.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/resources/colors_manager.dart';
import '../../../../../domain/entities/movie_summary_entity.dart';
import '../../../main_layout_provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
   final provider = Provider.of<MainLayoutProvider>(context);
    return BlocBuilder<HomeTabCubit, HomeTabState>(
      builder: (context, state) {
        if (state is HomeTabLoading) {
        return SizedBox(
          height: 600.h,
          child: const Center(child: CircularProgressIndicator(color: ColorsManager.white,)),
        );
        } else if (state is HomeTabOnError) {
          return Center(child: Text(state.message));
        } else if (state is HomeTabInitial) {
          return Container();
        } else if (state is HomeTabOnSuccess) {
          List<MovieSummaryEntity> movies = state.movies;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 600.h,
                  child: Stack(
                    children: [
                      MovieGradient(pic: movies[provider.selectedCarouselTab].mediumCoverImage ??''),
                      Padding(
                        padding: REdgeInsets.symmetric(vertical: 130),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              provider.onCarouselChange(index);
                            },
                            height: double.infinity,
                            enlargeCenterPage: true,
                            enlargeFactor: .4,
                            viewportFraction: .6,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(
                                milliseconds: 1500),
                            scrollPhysics: BouncingScrollPhysics(),

                          ),
                          items: movies.map((movie)=>MovieItem(pic: movie.mediumCoverImage ??'', rate: movie.rating ??0.0)).toList()
                        ),
                      ),
                    ],
                  ),

                ),
              ],
            ),
          );
        }else {
          return Container();
        }
      }

    );
  }
}
