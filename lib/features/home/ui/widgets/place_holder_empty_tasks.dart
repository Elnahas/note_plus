import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/app_string.dart';
import '../../../../core/helpers/spacing.dart';

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
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20.sp),
          ),
          verticalSpace(10),
          Text(
            AppString.noTaskSubTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
