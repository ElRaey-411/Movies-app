import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/movie_gradient.dart';
import 'package:movies_app/core/widgets/movie_item.dart';
import 'package:movies_app/features/main_layout/tabs/home_tab/widgets/category_list_view.dart';

import 'movie_model.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 600.h,
            child: Stack(
              children: [
                MovieGradient(pic: "assets/images/bg_movie.png"),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 130),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: double.infinity,
                      enlargeCenterPage: true,
                      enlargeFactor: .4,
                      viewportFraction: .6,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 1500),
                      scrollPhysics: BouncingScrollPhysics(),
      
                    ),
                    items: MovieModel.movieData.map((data) {
                      return MovieItem(
                        pic: data.pic,
                        rate: data.rate,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
      
          ),
          CategoryListView(categoryName: 'Action',)
          ,CategoryListView(categoryName: 'Drama',)
          ,CategoryListView(categoryName: 'Comedy',)

        ],
      ),
    );
  }
}
