// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/config/utils/size.dart';
import 'package:newsapp/config/utils/text.dart';
import 'package:newsapp/core/constants/assets.dart';
import 'package:newsapp/core/constants/colors.dart';

class RowArticleWidget extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String newsImage;
  final String newsAuthor;
  final String time;
  final Function()? onTap;

  const RowArticleWidget({
    Key? key,
    required this.image,
    required this.category,
    required this.title,
    required this.newsImage,
    required this.newsAuthor,
    required this.time,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) {
              return ClipRRect(
                borderRadius: AppSize.borderRadius6,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 96.w,
                  height: 96.h,
                ),
              );
            },
            progressIndicatorBuilder: (context, url, progress) =>
                const CircularProgressIndicator.adaptive(),
          ),
          SizedBox(width: 4.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                defaultText(
                  category,
                  color: AppColors.bodyText,
                  fontSize: AppSize.textXSmall,
                ),
                defaultText(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
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
          )
        ],
      ),
    );
  }
}
