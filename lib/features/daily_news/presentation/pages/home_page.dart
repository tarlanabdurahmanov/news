import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/config/utils/text.dart';
import 'package:newsapp/features/daily_news/presentation/pages/article_detail_page.dart';
import 'package:newsapp/features/daily_news/presentation/pages/bookmark_page.dart';
import '../../../../config/utils/size.dart';
import '../../../../core/constants/assets.dart';
import '../bloc/article/remote/remote_article_bloc.dart';
import 'notification_page.dart';
import 'trending_page.dart';
import '../widgets/row_article.dart';
import '../widgets/row_text.dart';
import '../widgets/textformfield.dart';
import '../widgets/trending_card.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: SvgPicture.asset(AppSvgAssets.logoSmall),
        titleSpacing: 24.w,
        centerTitle: false,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const BookmarkPage();
              }));
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: AppSize.borderRadius6,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: const Offset(0, 0),
                      )
                    ]),
                child: SvgPicture.asset(AppSvgAssets.bell),
              ),
            ),
          ),
          SizedBox(width: 24.w),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
              builder: (context, state) {
                if (state is RemoteArticleLoadingState) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (state is RemoteArticleErrorState) {
                  return Center(child: defaultText(state.error.toString()));
                }
                if (state is RemoteArticleDoneState) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: CustomTextFormField(
                          textEditingController: TextEditingController(),
                          prefixIcon: AppSvgAssets.search,
                          suffixIcon: AppSvgAssets.filter,
                          hintText: "Search",
                        ),
                      ),
                      RowTextWidget(
                        prefixText: "Trending",
                        suffixText: "See all",
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const TrendingPage();
                          }));
                        },
                      ),
                      SizedBox(height: 16.h),
                      TrendingCardWidget(
                        image: AppImageAssets.image1,
                        category: "Europe",
                        title: "Russian warship: Moskva sinks in Black Sea",
                        newsImage: AppImageAssets.bbcnews,
                        newsAuthor: "BBC News",
                        time: "4h ago",
                      ),
                      SizedBox(height: 16.h),
                      RowTextWidget(
                        prefixText: "Latest",
                        suffixText: "See all",
                        onTap: () {},
                      ),
                      SizedBox(height: 16.h),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.articles!.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          if (state.articles![index].urlToImage != '') {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ArticleDetailPage(
                                      artilce: state.articles![index]);
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 32.h),
                                child: RowArticleWidget(
                                  image: state.articles![index].urlToImage!,
                                  category: state.articles![index].author!,
                                  title: state.articles![index].description!,
                                  newsImage: AppImageAssets.bbcnews,
                                  newsAuthor: "BBC News",
                                  time: timeago.format(
                                    DateTime.parse(
                                        state.articles![index].publishedAt!),
                                    locale: 'tr',
                                    allowFromNow: true,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
