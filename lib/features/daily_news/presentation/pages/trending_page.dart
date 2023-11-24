import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../widgets/trending_card.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

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
        centerTitle: true,
        title: defaultText(
          "Trending",
          fontWeight: FontWeight.w600,
        ),
        actions: [
          SvgPicture.asset(AppSvgAssets.verticalDots),
          SizedBox(width: 24.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 21.w,
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return TrendingCardWidget(
              image: AppImageAssets.image1,
              category: "Europe",
              title: "Russian warship: Moskva sinks in Black Sea",
              newsImage: AppImageAssets.bbcnews,
              newsAuthor: "BBC News",
              time: "4h ago",
            );
          },
        ),
      ),
    );
  }
}
