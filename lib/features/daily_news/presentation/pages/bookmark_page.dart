import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/config/utils/size.dart';
import 'package:newsapp/config/utils/text.dart';
import 'package:newsapp/core/constants/assets.dart';
import 'package:newsapp/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:newsapp/features/daily_news/presentation/pages/article_detail_page.dart';
import 'package:newsapp/features/daily_news/presentation/widgets/row_article.dart';
import 'package:timeago/timeago.dart' as timeago;

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: defaultText(
          "Bookmark",
          fontSize: AppSize.textXSLarge,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<LocalArticleBloc, LocalArticleState>(
        builder: (context, state) {
          if (state is LocalArticleDoneState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ListView.builder(
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
                            DateTime.parse(state.articles![index].publishedAt!),
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
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
