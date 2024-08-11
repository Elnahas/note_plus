import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/theming/app_colors.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/widgets/app_elevated_button.dart';
import '../widgets/page_view_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(AppString.skip,
                      style: AppTextStyle.font16WhiteRegularOpacity44)),
              verticalSpace(100),
              PageViewWidget(controller: controller),
              verticalSpace(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppString.back,
                      style: AppTextStyle.font16WhiteRegularOpacity44),
                  AppElevatedButton(
                      height: 48.h,
                      width: 90.w,
                      borderRadius: 4.r,
                      buttonText: "Next",
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
