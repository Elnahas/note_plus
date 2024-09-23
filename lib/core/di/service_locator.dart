import 'package:get_it/get_it.dart';
import '../../features/add_task/logic/add_task_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<AddTaskCubit>(AddTaskCubit());

}
