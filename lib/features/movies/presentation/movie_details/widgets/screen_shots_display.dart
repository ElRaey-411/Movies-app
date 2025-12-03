import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenShotsDisplay extends StatelessWidget {
  const ScreenShotsDisplay({super.key, required this.screenShot,});

  final String screenShot;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(screenShot, fit: BoxFit.cover, width: double.infinity, height: 200.h,),
    );
  }
}
