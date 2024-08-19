import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:note_plus/core/helpers/app_assets.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import 'package:note_plus/core/theming/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/place_holder_empty_tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime startTime = DateTime.now();
    DateTime endTime = startTime.add(Duration(minutes: 15));

    String formattedTime =
        '${DateFormat('hh:mm a').format(startTime)} - ${DateFormat('hh:mm a').format(endTime)}';

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
          onPressed: () {}),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              verticalSpace(12),
              Text(
                AppString.today,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              verticalSpace(10),
              DatePicker(
                DateTime.now(),
                height: 94.h,
                width: 60.w,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: Colors.white,
                dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
              verticalSpace(70),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color:AppColors.red, 
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
                            leading:
                                const Icon(Icons.alarm, color: Colors.white),
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
              )
              //const PlaceHolderEmptyTasks()
            ],
          ),
        ),
      ),
    );
  }
}
