import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/colors_manager.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text,  this.icon});
  
  final String text;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 12,horizontal: 12),
      decoration: BoxDecoration(
        color: ColorsManager.grey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SizedBox(
        width: 102.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon==null ?false:true,
                child: SvgPicture.asset(icon??"")),
            Visibility(
                visible: icon==null ?false:true,
                child: SizedBox(width: 10.w)),
            Text(text, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.white)),
          ],
        ),
      ),
    );
  }
}
