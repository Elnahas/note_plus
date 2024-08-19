import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              verticalSpace(10),
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
                monthTextStyle:Theme.of(context).textTheme.displayMedium!,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
