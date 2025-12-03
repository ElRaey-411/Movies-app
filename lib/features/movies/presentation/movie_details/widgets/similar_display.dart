import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/movie_item.dart';

class SimilarDisplay extends StatelessWidget {
  const SimilarDisplay({super.key, required this.pic, required this.rate});

  final String pic;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 7 / 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        MovieItem(pic:pic,rate: rate),
        MovieItem(pic:pic,rate: rate),
        MovieItem(pic:pic,rate: rate),
        MovieItem(pic:pic,rate: rate),
      ]
    );
  }
}
