import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/movies/presentation/movie_details/widgets/cast_container.dart';
import 'package:movies_app/features/movies/presentation/movie_details/widgets/custom_container.dart';
import 'package:movies_app/features/movies/presentation/movie_details/widgets/genres_display.dart';
import 'package:movies_app/features/movies/presentation/movie_details/widgets/movie_gradient.dart';
import 'package:movies_app/features/movies/presentation/movie_details/widgets/screen_shots_display.dart';
import 'package:movies_app/features/movies/presentation/movie_details/widgets/similar_display.dart';

import '../../../../core/resources/assets_manager.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: REdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                MovieGradient(
                  pic: "assets/images/doctor_strange.png",
                  movieTitle: "Doctor Strange in the Multiverse of Madness",
                  movieYear: "2022",
                ),
                Positioned(
                  top: 36.h,
                  left: 12.w,
                  right: 12.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: ColorsManager.white,
                          size: 32.sp,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border_outlined,
                          color: ColorsManager.white,
                          size: 32.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(onTap: () {}, child: SvgPicture.asset(IconAssets.play)),
              ],
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomElevatedButton(
                    text: "Watch",
                    onPress: () {},
                    color: ColorsManager.red,
                    textColor: ColorsManager.white,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      CustomContainer(text: "15", icon: IconAssets.clock),
                      SizedBox(width: 10.w),
                      CustomContainer(text: "15", icon: IconAssets.heart),
                      SizedBox(width: 10.w),
                      CustomContainer(text: "15", icon: IconAssets.star),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "Screen Shots",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ScreenShotsDisplay(
                    screenShot: "assets/images/large-screenshot1.png",
                  ),
                  SizedBox(height: 20.h),
                  ScreenShotsDisplay(
                    screenShot: "assets/images/large-screenshot1.png",
                  ),
                  SizedBox(height: 20.h),
                  ScreenShotsDisplay(
                    screenShot: "assets/images/large-screenshot1.png",
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Similar",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SimilarDisplay(
                    pic:
                        "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-cover.jpg",
                    rate: 5.7,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Summary",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CastContainer(
                    pic:
                        "https://yts.lt/assets/images/actors/thumb/nm0001667.jpg",
                    name: "Doctor Strange",
                    character: "Doctor Strange",
                  ),
                  SizedBox(height: 10.h),
                  CastContainer(
                    pic:
                        "https://yts.lt/assets/images/actors/thumb/nm0001667.jpg",
                    name: "Doctor Strange",
                    character: "Doctor Strange",
                  ),
                  SizedBox(height: 10.h),
                  CastContainer(
                    pic:
                        "https://yts.lt/assets/images/actors/thumb/nm0001667.jpg",
                    name: "Doctor Strange",
                    character: "Doctor Strange",
                  ),
                  SizedBox(height: 10.h),
                  CastContainer(
                    pic:
                        "https://yts.lt/assets/images/actors/thumb/nm0001667.jpg",
                    name: "Doctor Strange",
                    character: "Doctor Strange",
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Genres",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GenresDisplay(genre: "Action"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
