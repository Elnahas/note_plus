part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}


final class GetTaskLoadingState extends HomeState {}
final class GetTaskSuccessState extends HomeState {
  final List<TaskModel> tasks;

  GetTaskSuccessState(this.tasks);
}
final class GetTaskErrorState extends HomeState {
  final String err;

  GetTaskErrorState(this.err);
}