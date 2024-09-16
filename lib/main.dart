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

import 'core/helpers/shared_pref_helper.dart';

void main() async {
    setupGetIt();

  Bloc.observer = SimpleBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await checkIfSeenOnboarding();

  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kNotesBox);

  runApp(MyApp(appRouter: AppRouter()));
}

checkIfSeenOnboarding() async {
  isSeenOnboarding =
      await SharedPrefHelper.getBool(SharedPrefKeys.hasSeenOnboarding);
}
