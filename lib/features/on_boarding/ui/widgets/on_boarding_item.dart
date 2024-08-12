import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {super.key,
      required this.controller,
      required this.imagePath,
      required this.title,
      required this.subTitle});

  final PageController controller;
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 220.h,
            width: 240.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          verticalSpace(75),
          Text(
            title,
            style: AppTextStyle.font32WhiteBoldOpacity87,
          ),
          verticalSpace(30),
          Text(
            subTitle,
            style: AppTextStyle.font16WhiteRegularOpacity87,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
