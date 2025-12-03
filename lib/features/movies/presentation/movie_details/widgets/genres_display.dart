import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container.dart';

class GenresDisplay extends StatelessWidget {
  const GenresDisplay({super.key, required this.genre});

  final List<String>? genre;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: genre?.length?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 6.w,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) {
        return CustomContainer(text: genre![index],);
      },
    );
  }
}
