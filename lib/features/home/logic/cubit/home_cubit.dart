import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_plus/core/helpers/constants.dart';
import '../../../../core/data/task_model.dart';
import '../../ui/widgets/task_item_widget.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<TaskModel> allTasks = [];

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
      if (tasks.isNotEmpty) {
        allTasks = tasks;
        emit(GetTaskSuccessState(tasks));
      } else {
        emit(EmptyPlaceHolderState());
      }
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
      allTasks = tasks;
      emit(GetTaskSuccessState(tasks));
    } catch (e) {
      emit(GetTaskErrorState(e.toString()));
    }
  }

  deleteTask(int index) async {
    var removeItem =  allTasks.removeAt(index);
    await removeItem.delete();
    
    listKey.currentState!.removeItem(
      index,
      (context, animation) => SlideTransition(
        
        position: animation.drive(
          
          Tween<Offset>(
            
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.easeInOut),
          ),
        ),
        child: TaskItemWidget(
          taskModel: removeItem,
          index: index,
        ),
      ),
      duration: const Duration(milliseconds: 500),
    );

      await Future.delayed(const Duration(milliseconds: 500));


    if (allTasks.isNotEmpty) {
      emit(GetTaskSuccessState(allTasks));
    } else {
      emit(EmptyPlaceHolderState());
    }
  }

  clearAllTasks() async {
    var noteBox = Hive.box<TaskModel>(kNotesBox);
    await noteBox.clear();
  }
}
