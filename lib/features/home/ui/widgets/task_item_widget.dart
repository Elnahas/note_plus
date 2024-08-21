import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import 'package:note_plus/core/widgets/app_elevated_button.dart';

import '../../../../core/theming/app_colors.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime startTime = DateTime.now();
    DateTime endTime = startTime.add(const Duration(minutes: 15));

    String formattedTime =
        '${DateFormat('hh:mm a').format(startTime)} - ${DateFormat('hh:mm a').format(endTime)}';

    return GestureDetector(
      onTap: (){
        showModalBottomSheet(context: context, builder: (context) {
          return Container(
            padding: const EdgeInsets.all(24),
            height: 240.h,
            color: AppColors.deepGray,
            child:  Column(
              children: [
                AppElevatedButton(buttonText: AppString.taskCompleted.toUpperCase(), onPressed: (){}, height: 48.h,),
                verticalSpace(24),
                AppElevatedButton(buttonText: AppString.deleteTask.toUpperCase(),backgroundColor: AppColors.redLight, onPressed: (){},height: 48.h,),
                verticalSpace(24),
                AppElevatedButton(buttonText: AppString.cancel.toUpperCase(), onPressed: (){
                  context.pop();
                },height: 48.h,),
              ],
            ),
          );
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.red,
        ),
        height: 128,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task1",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  ListTile(
                    title: Text(
                      formattedTime,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    leading: const Icon(Icons.alarm, color: Colors.white),
                    contentPadding: EdgeInsets.zero,
                  ),
                  Text(
                    "Learn Dart",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            VerticalDivider(
              endIndent: 20,
              indent: 20,
              color: AppColors.darkGray,
              thickness: 1,
              width: 20,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                "TODO",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
