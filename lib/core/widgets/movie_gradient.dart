import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class MovieGradient extends StatelessWidget {
  const MovieGradient({super.key, required this.pic});

  final String pic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          pic,
          fit: BoxFit.cover,
          width:double.infinity ,
        ),
        Container(
          width: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorsManager.black.withValues(alpha: .8),
                ColorsManager.black.withValues(alpha: .6),
                ColorsManager.black.withValues(alpha: 1),
              ],
            ),
          ),
        ),
        Positioned(
          top: 35,
          left: 60,
          child: Image.asset(
            "assets/images/available_watch_now_movie.png",
            fit: BoxFit.cover,
            height: 550.h,
          ),
        ),
      ],
    );
  }
}
