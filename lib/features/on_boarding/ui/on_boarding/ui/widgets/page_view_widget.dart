import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_plus/features/on_boarding/ui/on_boarding/ui/widgets/on_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../data/on_boarding_model.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => OnBoardingItem(
                  controller: controller,
                  imagePath: OnBoardingModel.onBoardingList[index].imagePath,
                  title: OnBoardingModel.onBoardingList[index].title,
                  subTitle: OnBoardingModel.onBoardingList[index].subTitle),
              controller: controller,
              itemCount: OnBoardingModel.onBoardingList.length),
          Positioned(
              bottom: 250.h,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: SlideEffect(
                        dotColor: AppColors.darkGray,
                        activeDotColor: AppColors.white.withOpacity(0.87),
                        dotWidth: 27.w,
                        dotHeight: 4.w,
                        spacing: 10,
                        radius: 56.r),
                    onDotClicked: (index) {}),
              ))
        ],
      ),
    );
  }
}
