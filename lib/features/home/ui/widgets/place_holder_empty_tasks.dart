import 'package:flutter/material.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/app_string.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';

class PlaceHolderEmptyTasks extends StatelessWidget {
  const PlaceHolderEmptyTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppAssets.placeholder),
          Text(
            AppString.noTaskTitle,
            style: AppTextStyle.font20WhiteRegularOpacity87,
          ),
          verticalSpace(10),
          Text(
            AppString.noTaskSubTitle,
            style: AppTextStyle.font16WhiteRegularOpacity87,
          ),
        ],
      ),
    );
  }
}
