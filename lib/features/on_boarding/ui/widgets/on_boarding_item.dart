import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
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
            style: Theme.of(context).textTheme.displayLarge,
          ),
          verticalSpace(30),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
