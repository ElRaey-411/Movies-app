import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_network_image/safe_network_image.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../data/models/movie_details/Cast.dart';

class CastContainer extends StatelessWidget {
  const CastContainer({super.key,required this.cast});

 final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsManager.grey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: SafeNetworkImage(
              url: cast.urlSmallImage,
            ),
          ),
          SizedBox(width: 12.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : ${cast.name}", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)),
                Text("Character : ${cast.characterName} ", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
