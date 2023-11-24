import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/config/utils/custom_font_size.dart';
import 'package:newsapp/config/utils/size.dart';
import 'package:newsapp/config/utils/text.dart';
import 'package:newsapp/core/constants/assets.dart';
import 'package:newsapp/core/constants/colors.dart';
import 'package:newsapp/features/daily_news/domain/entities/article.dart';
import 'package:newsapp/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:newsapp/features/daily_news/presentation/widgets/button/primary_button.dart';

class ArticleDetailPage extends StatelessWidget {
  final ArtilceEntity artilce;

  const ArticleDetailPage({super.key, required this.artilce});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(AppSvgAssets.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          SvgPicture.asset(AppSvgAssets.share),
          SizedBox(width: 8.w),
          SvgPicture.asset(AppSvgAssets.verticalDots),
          SizedBox(width: 24.w),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Colors.black.withOpacity(0.01),
              blurRadius: 20,
              spreadRadius: 20,
            )
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 20.w,
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Row(
            children: [
              SvgPicture.asset(AppSvgAssets.heart),
              SizedBox(width: 4.w),
              defaultText("24.5K", color: AppColors.titleActive),
              SizedBox(width: 20.w),
              SvgPicture.asset(AppSvgAssets.comment),
              SizedBox(width: 4.w),
              defaultText("1K", color: AppColors.titleActive),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<LocalArticleBloc>(context)
                      .add(SaveArticle(artilce));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.black,
                      content: Text('Article saved successfully.'),
                    ),
                  );
                },
                child: SvgPicture.asset(AppSvgAssets.bookmark),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: artilce.urlToImage!,
                imageBuilder: (context, imageProvider) {
                  return ClipRRect(
                    borderRadius: AppSize.borderRadius6,
                    child: Image.network(
                      artilce.urlToImage!,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      height: 248.h,
                    ),
                  );
                },
                progressIndicatorBuilder: (context, url, progress) =>
                    const CircularProgressIndicator.adaptive(),
              ),
              SizedBox(height: 8.h),
              defaultText(
                artilce.author!,
                color: AppColors.bodyText,
                fontSize: AppSize.textXSmall,
              ),
              defaultText(
                artilce.title!,
                fontSize: AppSize.textLarge,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 16.h),
              defaultText(
                "${artilce.description!}\n\n${artilce.content!}",
                color: AppColors.bodyText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
