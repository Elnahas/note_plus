import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_plus/core/helpers/constants.dart';
import '../../../../core/data/task_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getTaskList() {
    emit(GetTaskLoadingState());
    try {
      var noteBox = Hive.box<TaskModel>(kNotesBox);
      var tasks = noteBox.values.toList();

      emit(GetTaskSuccessState(tasks));
    } catch (e) {
      emit(GetTaskErrorState(e.toString()));
    }
  }

  getTasksForSelectedDate(String selectedDate) {
    emit(GetTaskLoadingState());
    try {
      var noteBox = Hive.box<TaskModel>(kNotesBox);
      var tasks =
          noteBox.values.where((task) => task.date == selectedDate).toList();
      emit(GetTaskSuccessState(tasks));
    } catch (e) {
      emit(GetTaskErrorState(e.toString()));
    }
  }

  updateTaskCompletion(TaskModel taskModel) async {
    try {
      var noteBox = Hive.box<TaskModel>(kNotesBox);

      taskModel.isCompleted = true;
      taskModel.save();

      var tasks =
          noteBox.values.where((task) => task.date == taskModel.date).toList();

      emit(GetTaskSuccessState(tasks));
    } catch (e) {
      emit(GetTaskErrorState(e.toString()));
    }
  }

  deleteTask(TaskModel taskModel) async {
    var noteBox = Hive.box<TaskModel>(kNotesBox);
    await taskModel.delete();

    var tasks =
        noteBox.values.where((task) => task.date == taskModel.date).toList();

    emit(GetTaskSuccessState(tasks));
  }

  clearAllTasks() async {
    var noteBox = Hive.box<TaskModel>(kNotesBox);
    await noteBox.clear();
  }
}
