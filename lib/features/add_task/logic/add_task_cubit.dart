import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_plus/core/data/task_model.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/theming/app_colors.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  DateTime currentDate = DateTime.now();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(minutes: 45));

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

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

  //Functions
  void getDatePicker(context) async {
    var pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      initialDate: currentDate,
      initialDatePickerMode: DatePickerMode.day,
    );

    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSuccessState());
    }
  }

  //
  void getStartTimePicker(context) async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (pickedTime != null) {
      startTime = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      emit(StartTimeSuccessState());
    }
  }

  void getEndTimePicker(context) async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (pickedTime != null) {
      endTime = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      emit(EndTimeSuccessState());
    }
  }

  void changeColorIndex(int index) {
    selectedColorIndex = index;
    emit(ChangeColorIndexSuccessState());
  }

  addTask(TaskModel taskModel) async {
    emit(AddTaskLoadingState());

    try {
      var noteBox = Hive.box<TaskModel>(kNotesBox);
      await noteBox.add(taskModel);
      emit(AddTaskSuccessState(taskModel: taskModel));      
    } catch (e) {
      emit(AddTaskErrorState(e.toString()));
    }
  }

  


  //Getters

  List<TaskModel> getTasks() {
    return Hive.box<TaskModel>(kNotesBox).values.toList();
  }


}
