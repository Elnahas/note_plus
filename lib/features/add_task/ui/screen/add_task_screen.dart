import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import 'package:note_plus/core/widgets/app_elevated_button.dart';
import 'package:note_plus/core/widgets/app_label_text.dart';
import 'package:note_plus/core/widgets/app_text_form_field.dart';
import 'package:note_plus/features/add_task/logic/add_task_cubit.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<AddTaskCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Task",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(48),
                AppTextFormField(
                  labelText: AppString.title,
                  hintText: AppString.enterTitleHere,
                  validator: (p0) {},
                ),
                verticalSpace(24),
                AppTextFormField(
                  labelText: AppString.note,
                  hintText: AppString.enterNoteHere,
                  validator: (p0) {},
                ),
                verticalSpace(24),
                BlocBuilder<AddTaskCubit, AddTaskState>(
                  buildWhen: (previous, current) =>
                      current is GetDateSuccessState,
                  builder: (context, state) {
                    return AppTextFormField(
                      readOnly: true,
                      labelText: AppString.date,
                      hintText: DateFormat.yMd().format(_cubit.currentDate),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            _cubit.getDatePicker(context);
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          )),
                      validator: (p0) {},
                    );
                  },
                ),
                verticalSpace(24),
                BlocBuilder<AddTaskCubit, AddTaskState>(
                  buildWhen: (previous, current) =>
                      current is StartTimeSuccessState ||
                      current is EndTimeSuccessState,
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: AppTextFormField(
                            readOnly: true,
                            labelText: AppString.startTime,
                            hintText:
                                DateFormat("hh:mm a").format(_cubit.startTime),
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  _cubit.getStartTimePicker(context);
                                },
                                icon: const Icon(
                                  Icons.timer_sharp,
                                  color: Colors.white,
                                )),
                            validator: (p0) {},
                          ),
                        ),
                        horizontalSpace(27),
                        Expanded(
                          child: AppTextFormField(
                            readOnly: true,
                            labelText: AppString.endTime,
                            hintText:
                                DateFormat("hh:mm a").format(_cubit.endTime),
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  _cubit.getEndTimePicker(context);
                                },
                                icon: const Icon(
                                  Icons.timer_sharp,
                                  color: Colors.white,
                                )),
                            validator: (p0) {},
                          ),
                        ),
                      ],
                    );
                  },
                ),
                verticalSpace(24),
                const AppLabelText(labelText: "Color"),
                verticalSpace(8),
                BlocBuilder<AddTaskCubit, AddTaskState>(
                  buildWhen: (previous, current) =>
                      current is ChangeColorIndexSuccessState,
                  builder: (context, state) {
                    return SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        itemCount: _cubit.colors.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _cubit.changeColorIndex(index);
                            },
                            child: Container(
                              margin: const EdgeInsetsDirectional.only(end: 12),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: _cubit.colors[index],
                                child: index == _cubit.selectedColorIndex
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                verticalSpace(92),
                AppElevatedButton(
                  buttonText: AppString.createTask.toUpperCase(),
                  height: 48,
                  borderRadius: 4,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
