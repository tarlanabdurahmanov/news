import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/utils/size.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';

class TrendingCardWidget extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String newsImage;
  final String newsAuthor;
  final String time;
  final Function()? onTap;

  const TrendingCardWidget({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.newsImage,
    required this.newsAuthor,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: AppSize.borderRadius6,
            child: Image.asset(image),
          ),
          SizedBox(height: 8.h),
          defaultText(
            category,
            color: AppColors.bodyText,
            fontSize: AppSize.textXSmall,
          ),
          defaultText(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 10.r,
                    backgroundImage: AssetImage(newsImage),
                  ),
                  SizedBox(width: 4.h),
                  defaultText(
                    newsAuthor,
                    color: AppColors.bodyText,
                    fontSize: AppSize.textXSmall,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 12.h),
                  SvgPicture.asset(AppSvgAssets.clock),
                  SizedBox(width: 4.h),
                  defaultText(
                    time,
                    color: AppColors.bodyText,
                    fontSize: AppSize.textXSmall,
                  ),
                ],
              ),
              SvgPicture.asset(AppSvgAssets.horizontalDots),
            ],
          ),
        ],
      ),
    );
  }
}
