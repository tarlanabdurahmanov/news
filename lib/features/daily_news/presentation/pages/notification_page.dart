import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/utils/custom_font_size.dart';
import '../../../../config/utils/size.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/button/outline_button.dart';
import '../widgets/trending_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
          "Notification",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultText(
                "Today, April 22",
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16.h),
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  borderRadius: AppSize.borderRadius6,
                  color: AppColors.secondaryButton,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: AppSize.borderRadius6,
                      child: Image.asset(
                        AppImageAssets.bbcnews,
                        width: 70.w,
                        height: 70.w,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'BBC News',
                              style: TextStyle(
                                color: AppColors.titleActive,
                                fontSize: 15.csp,
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      " has posted new europe news “Ukraine's President Zele...”",
                                  style: TextStyle(
                                    color: AppColors.titleActive,
                                    fontSize: 15.csp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 4.w),
                          defaultText(
                            "15m ago",
                            color: AppColors.bodyText,
                            fontSize: AppSize.textXSmall,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 16.w),
                    // OutlineButton(
                    //   onPressed: () {},
                    //   text: "Follow",
                    //   isIcon: true,
                    //   isIconLeft: true,
                    // ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  borderRadius: AppSize.borderRadius6,
                  color: AppColors.secondaryButton,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: AppSize.borderRadius6,
                      child: Image.asset(
                        AppImageAssets.user1,
                        width: 70.w,
                        height: 70.w,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Modelyn Saris',
                              style: TextStyle(
                                color: AppColors.titleActive,
                                fontSize: 15.csp,
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " is now following you",
                                  style: TextStyle(
                                    color: AppColors.titleActive,
                                    fontSize: 15.csp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 4.w),
                          defaultText(
                            "15m ago",
                            color: AppColors.bodyText,
                            fontSize: AppSize.textXSmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    OutlineButton(
                      onPressed: () {},
                      text: "Follow",
                      isIcon: true,
                      isIconLeft: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
