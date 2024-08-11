import 'package:note_plus/core/helpers/app_assets.dart';
import 'package:note_plus/core/helpers/app_string.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.imagePath, required this.title, required this.subTitle});

  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        imagePath: AppAssets.onBoarding1,
        title: AppString.onBoardingTitleOne,
        subTitle: AppString.onBoardingSubTitleOne),
    OnBoardingModel(
        imagePath: AppAssets.onBoarding2,
        title: AppString.onBoardingTitleTwo,
        subTitle: AppString.onBoardingSubTitleTwo),
    OnBoardingModel(
        imagePath: AppAssets.onBoarding3,
        title: AppString.onBoardingTitleThree,
        subTitle: AppString.onBoardingSubTitleThree)
  ];
}
