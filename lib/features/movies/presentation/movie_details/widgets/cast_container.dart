import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';

class CastContainer extends StatelessWidget {
  const CastContainer({super.key,required this.pic , required this.name, required this.character});

  final String pic;
  final String name;
  final String character;


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
            child: Image.network(pic)
          ),
          SizedBox(width: 12.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : $name", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)),
              Text("Character : $character ", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)),
            ],
          )
        ],
      ),
    );
  }
}
