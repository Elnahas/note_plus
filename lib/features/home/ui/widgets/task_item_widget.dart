import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_plus/core/data/task_model.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import 'package:note_plus/core/widgets/app_elevated_button.dart';

import '../../../../core/theming/app_colors.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModel taskModel;
  const TaskItemWidget({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        '${taskModel.startTime} - ${taskModel.endTime}';

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
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(taskModel.color),
        ),
        height: 135,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
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
                    taskModel.note,
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
