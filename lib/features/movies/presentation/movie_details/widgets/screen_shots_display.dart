import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_network_image/safe_network_image.dart';

class ScreenShotsDisplay extends StatelessWidget {
  const ScreenShotsDisplay({super.key, required this.screenShot,});

  final String? screenShot;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: SafeNetworkImage(
        url: screenShot,
        fit: BoxFit.cover,
        height: 200.h,
        width: double.infinity,
      )
    );
  }
}
