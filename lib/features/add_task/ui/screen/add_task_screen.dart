import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import 'package:note_plus/core/widgets/app_elevated_button.dart';
import 'package:note_plus/core/widgets/app_label_text.dart';
import 'package:note_plus/core/widgets/app_text_form_field.dart';

import '../../../../core/theming/app_colors.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime currentDate = DateTime.now();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(minutes: 45));

  //List of colors
  List<Color> colors = [
    AppColors.red,
    AppColors.green,
    AppColors.blueSky,
    AppColors.blue,
    AppColors.orange,
    AppColors.purple,
  ];

  int selectedColorIndex = 0;

  

  @override
  Widget build(BuildContext context) {
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
                AppTextFormField(
                  readOnly: true,
                  labelText: AppString.date,
                  hintText: DateFormat.yMd().format(currentDate),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        var pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 30)),
                          initialDate: currentDate,
                          initialDatePickerMode: DatePickerMode.day,
                        );
            
                        if (pickedDate != null) {
                          setState(() {
                            currentDate = pickedDate;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      )),
                  validator: (p0) {},
                ),
                verticalSpace(24),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        readOnly: true,
                        labelText: AppString.startTime,
                        hintText: DateFormat("hh:mm a").format(startTime),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              var timePicked = await showTimePicker(
                                  context: context, initialTime: TimeOfDay.now());
            
                              if (timePicked != null) {
                                setState(() {
                                  startTime = DateTime(
                                    currentDate.year,
                                    currentDate.month,
                                    currentDate.day,
                                    timePicked.hour,
                                    timePicked.minute,
                                  );
                                });
                              }
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
                        hintText: DateFormat("hh:mm a")
                            .format(endTime),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              var timePicked = await showTimePicker(
                                  context: context, initialTime: TimeOfDay.now());
            
                              if (timePicked != null) {
                                setState(() {
                                  endTime = DateTime(
                                    currentDate.year,
                                    currentDate.month,
                                    currentDate.day,
                                    timePicked.hour,
                                    timePicked.minute,
                                  );
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.timer_sharp,
                              color: Colors.white,
                            )),
                        validator: (p0) {},
                      ),
                    ),
                  ],
                ) ,

                verticalSpace(24),

                const AppLabelText(labelText: "Color"),
                verticalSpace(8),

                SizedBox(
                  height: 40.h,
                  child: ListView.builder(
                    itemCount: colors.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColorIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(end: 12),
                          child: CircleAvatar(
                            radius: 20,
                            
                            backgroundColor: colors[index],
                            child: index == selectedColorIndex
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
                ),





                verticalSpace(92),

                 AppElevatedButton(buttonText: AppString.createTask.toUpperCase(), height: 48, borderRadius: 4, onPressed: () {
                   
                 },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
