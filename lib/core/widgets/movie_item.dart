import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.pic, required this.rate});

 final String pic;
 final double rate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(pic,fit: BoxFit.cover)
        ),
        Positioned(
          top: 10,
          left: 8,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: ColorsManager.black.withValues(alpha:.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  "$rate",
                  style: TextStyle(
                      color: ColorsManager.white, fontSize: 16.sp
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.star,
                  color: ColorsManager.yellow,
                  size: 16.sp,
                )
              ],
            ),
          ),
        ),
      ]
    );
  }
}
