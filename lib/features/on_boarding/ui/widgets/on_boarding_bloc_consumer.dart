
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/features/on_boarding/logic/on_boarding_cubit.dart';

import '../../../../core/helpers/app_string.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';

class OnBoardingBlocConsumer extends StatelessWidget {
  const OnBoardingBlocConsumer({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listenWhen: (previous, current) =>
          current is OnBoardingCompleted,
      listener: (context, state) async {
        context.pushReplacementNamed(Routes.home);
        await SharedPrefHelper.setData(SharedPrefKeys.hasSeenOnboarding, true);
      },
      buildWhen: (previous, current) =>
          current is OnBoardingPageChanged,
      builder: (context, state) {
        int currentPage = 0;
        if (state is OnBoardingPageChanged) {
          currentPage = state.currentPage;
        }
    
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentPage > 0)
              GestureDetector(
                onTap: () {
                  context
                      .read<OnBoardingCubit>()
                      .onBackPage(currentPage);
                  controller.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
                child: Text(
                  AppString.back,
                  style: AppTextStyle.font16WhiteRegularOpacity44,
                ),
              ),
            if (currentPage == 0) const SizedBox(),
            AppElevatedButton(
              height: 48.h,
              width: 90.w,
              borderRadius: 4.r,
              buttonText: currentPage == 2
                  ? AppString.getStarted
                  : AppString.next,
              onPressed: () {
                if (currentPage < 2) {
                  context
                      .read<OnBoardingCubit>()
                      .onNextPage(currentPage);
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                } else {
                  context.read<OnBoardingCubit>().onSkip();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
