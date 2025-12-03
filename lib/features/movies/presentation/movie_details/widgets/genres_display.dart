import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container.dart';

class GenresDisplay extends StatelessWidget {
  const GenresDisplay({super.key, required this.genre});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 3,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CustomContainer(text: genre),
          CustomContainer(text: genre),
          CustomContainer(text: genre),
          CustomContainer(text: genre),
          CustomContainer(text: genre),
        ]
    );
  }
}
