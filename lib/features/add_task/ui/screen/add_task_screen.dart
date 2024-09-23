import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import 'package:note_plus/core/service/local_notification_service.dart';
import 'package:note_plus/core/widgets/app_elevated_button.dart';
import 'package:note_plus/core/widgets/app_label_text.dart';
import 'package:note_plus/core/widgets/app_text_form_field.dart';
import 'package:note_plus/features/add_task/logic/add_task_cubit.dart';

import '../../../../core/data/task_model.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/routing/routes.dart';

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
            key: _cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(48),
                AppTextFormField(
                  controller: _cubit.titleController,
                  labelText: AppString.title,
                  hintText: AppString.enterTitleHere,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                ),
                verticalSpace(24),
                AppTextFormField(
                  controller: _cubit.noteController,
                  labelText: AppString.note,
                  hintText: AppString.enterNoteHere,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Please enter note";
                    }
                    return null;
                  },
                ),
                verticalSpace(24),
                BlocBuilder<AddTaskCubit, AddTaskState>(
                  buildWhen: (previous, current) =>
                      current is GetDateSuccessState,
                  builder: (context, state) {
                    return AppTextFormField(
                      readOnly: true,
                      labelText: AppString.date,
                      hintText: getFormattedDate(_cubit.currentDate),
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
                            hintText: getFormattedTime(_cubit.startTime),
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
                            hintText: getFormattedTime(_cubit.endTime),
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
                  onPressed: () {
                    if (_cubit.formKey.currentState!.validate()) {
                      _cubit.addTask(TaskModel(
                        id: _cubit.getTasks().length + 1,
                        title: _cubit.titleController.text,
                        note: _cubit.noteController.text,
                        date: getFormattedDate(_cubit.currentDate),
                        startTime: getFormattedTime(_cubit.startTime),
                        endTime: getFormattedTime(_cubit.endTime),
                        color: _cubit.colors[_cubit.selectedColorIndex].value,
                        isCompleted: false,
                      ));
                    }
                  },
                ),
                BlocListener<AddTaskCubit, AddTaskState>(
                  listenWhen: (previous, current) =>
                      current is AddTaskSuccessState,
                  listener: (context, state) {
                    if (state is AddTaskSuccessState) {
                      final taskModel = state.taskModel;

                      LocalNotificationService.showTaskNotification(
                          currentDate: _cubit.currentDate,
                          scheduledTime: TimeOfDay(
                              hour: _cubit.startTime.hour,
                              minute: _cubit.startTime.minute),
                          taskModel: taskModel);
                      context.pushNamedAndRemoveUntil(Routes.home,
                          predicate: (route) => true);

                      Fluttertoast.showToast(
                          msg: "Task created successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
