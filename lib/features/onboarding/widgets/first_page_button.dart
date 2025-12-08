import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';

class FirstPageButton extends StatelessWidget {
  const FirstPageButton({super.key, required this.pageController});
  final PageController pageController;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      
      child: ElevatedButton(
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.yellow,
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child:  Padding(
          padding:  REdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Explore Now',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
