import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/resources/colors_manager.dart';
import '../../../../../../../../core/widgets/movie_item.dart';


class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: TextStyle(
                  color: ColorsManager.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(children: [
                Text(
                  "See More ",
                  style: TextStyle(
                    color: ColorsManager.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.arrow_forward, color: ColorsManager.yellow,size: 16,),
              ],),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  MovieItem(pic: 'assets/images/cap_movie.png', rate: 5.7),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
