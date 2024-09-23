import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_plus/app/my_app.dart';
import 'package:note_plus/core/data/task_model.dart';
import 'package:note_plus/core/di/service_locator.dart';
import 'package:note_plus/core/helpers/constants.dart';
import 'package:note_plus/core/helpers/simple_bloc_observer.dart';
import 'package:note_plus/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_plus/core/service/local_notification_service.dart';
import 'package:note_plus/core/service/work_manager_service.dart';

import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // When I used async in my main must call this line here
  setupGetIt();

  await Future.wait([
    LocalNotificationService.init(),
    //WorkManagerService().init(),
    ScreenUtil.ensureScreenSize(),
    checkIfSeenOnboarding(),
    Hive.initFlutter()
  ]);

  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kNotesBox);

  runApp(MyApp(appRouter: AppRouter()));
}

Future<void> checkIfSeenOnboarding() async {
  isSeenOnboarding =
      await SharedPrefHelper.getBool(SharedPrefKeys.hasSeenOnboarding);
}
