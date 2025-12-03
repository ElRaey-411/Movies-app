import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_network_image/safe_network_image.dart';
import '../../../../../core/resources/colors_manager.dart';

class MovieGradient extends StatelessWidget {
  const MovieGradient({super.key, required this.pic, required this.movieTitle, required this.movieYear});

  final String pic;
  final String movieTitle;
  final String movieYear;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 680.h,
      child: Stack(
        children: [
          SafeNetworkImage(
            url: pic,
            fit: BoxFit.cover,
            height: 680.h,
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
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
            bottom:20.h,
            left: 30.w,
            right: 30.w,
            child: Column(
              children: [
                Text(movieTitle, style: TextStyle(color: ColorsManager.white, fontSize: 24.sp, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                SizedBox(height: 10.h),
                Text(movieYear, style: TextStyle(color: ColorsManager.greyAD, fontSize: 24.sp, fontWeight: FontWeight.bold)),
              ]
            ),
          )
        ],
      ),
    );
  }
}