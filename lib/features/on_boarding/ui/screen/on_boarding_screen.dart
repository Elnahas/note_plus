import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/core/routing/routes.dart';
import 'package:note_plus/core/theming/app_colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../logic/on_boarding_cubit.dart';
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
                  child: GestureDetector(
                    onTap: () {
                      controller.animateToPage(2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Text(AppString.skip,
                        style: AppTextStyle.font16WhiteRegularOpacity44),
                  )),
              verticalSpace(100),
              PageViewWidget(
                controller: controller,
                onPageChanged: (index) {
                  context.read<OnBoardingCubit>().onPageChanged(index);
                },
              ),
              verticalSpace(50),
              BlocConsumer<OnBoardingCubit, OnBoardingState>(
                listenWhen: (previous, current) =>
                    current is OnBoardingCompleted,
                listener: (context, state) {
                  context.pushReplacementNamed(Routes.home);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
