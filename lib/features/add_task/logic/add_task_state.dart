part of 'add_task_cubit.dart';

sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class GetDateLoadingState extends AddTaskState {}
final class GetDateSuccessState extends AddTaskState {}
final class GetDateErrorState extends AddTaskState {}


final class StartTimeLoadingState extends AddTaskState {}
final class StartTimeSuccessState extends AddTaskState {}
final class StartTimeErrorState extends AddTaskState {}

final class EndTimeLoadingState extends AddTaskState {}
final class EndTimeSuccessState extends AddTaskState {}
final class EndTimeErrorState extends AddTaskState {}

final class ChangeColorIndexLoadingState extends AddTaskState {}
final class ChangeColorIndexSuccessState extends AddTaskState {}
final class ChangeColorIndexErrorState extends AddTaskState {}


final class AddTaskLoadingState extends AddTaskState {}
final class AddTaskSuccessState extends AddTaskState {}
final class AddTaskErrorState extends AddTaskState {
  final String err;

  AddTaskErrorState(this.err);
}



