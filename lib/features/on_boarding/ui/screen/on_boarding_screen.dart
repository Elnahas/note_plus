import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../logic/on_boarding_cubit.dart';
import '../widgets/on_boarding_bloc_consumer.dart';
import '../widgets/page_view_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
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
              OnBoardingBlocConsumer(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
