import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import 'package:note_plus/core/routing/routes.dart';
import 'package:note_plus/features/home/logic/cubit/home_cubit.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/place_holder_empty_tasks.dart';
import '../widgets/task_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
          onPressed: () {
            context.pushNamed(Routes.addTask);
            //context.read<HomeCubit>().clearAllTasks();
          }),
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
                  String formattedDate = getFormattedDate(date);

                  context
                      .read<HomeCubit>()
                      .getTasksForSelectedDate(formattedDate);
                },
              ),
              verticalSpace(70),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is GetTaskSuccessState,
                builder: (context, state) {
                  if (state is GetTaskSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          final task = state.tasks[index];
                          return TaskItemWidget(taskModel: task);
                        },
                      ),
                    );
                  } else {
                    return const PlaceHolderEmptyTasks();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
