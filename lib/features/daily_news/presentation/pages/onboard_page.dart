import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/utils/size.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/button/primary_button.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  var onboards = [
    {
      "image": AppImageAssets.onboard1,
      "title": "Lorem Ipsum is simply dummy",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    },
    {
      "image": AppImageAssets.onboard2,
      "title": "Lorem Ipsum is simply dummy",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    },
    {
      "image": AppImageAssets.onboard3,
      "title": "Lorem Ipsum is simply dummy",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    },
  ];

  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                controller: _pageController,
                itemCount: onboards.length,
                itemBuilder: (context, index) {
                  return OnboardItem(
                    image: onboards[index]['image']!,
                    title: onboards[index]['title']!,
                    description: onboards[index]['description']!,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                children: [
                  ..._buildPageIndicator(),
                  const Spacer(),
                  Row(
                    children: [
                      if (currentPage == 0)
                        PrimaryButton(
                          onPressed: () {
                            setState(() {
                              ++currentPage;
                            });
                            _pageController.animateToPage(
                              currentPage,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          text: "Next",
                        )
                      else ...[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              --currentPage;
                            });
                            _pageController.animateToPage(
                              currentPage,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: defaultText(
                            "Back",
                            color: AppColors.bodyDarkmode,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        PrimaryButton(
                          onPressed: () {
                            if (currentPage != 2) {
                              setState(() {
                                ++currentPage;
                              });
                              _pageController.animateToPage(
                                currentPage,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                          text: currentPage != 2 ? "Next" : "Get Started",
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < onboards.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5.w),
      height: 14.w,
      width: 14.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primary : AppColors.placeholder,
      ),
    );
  }
}

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Padding(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 6.h),
          child: defaultText(
            title,
            fontSize: AppSize.textXLarge,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 50.w),
          child: defaultText(
            description,
            color: AppColors.bodyText,
          ),
        ),
      ],
    );
  }
}
