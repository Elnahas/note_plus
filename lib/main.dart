import 'package:flutter/material.dart';
import 'package:note_plus/app/my_app.dart';
import 'package:note_plus/core/helpers/constants.dart';
import 'package:note_plus/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/shared_pref_helper.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
    await checkIfSeenOnboarding();
  runApp( MyApp(appRouter: AppRouter()));
}

checkIfSeenOnboarding() async {
  isSeenOnboarding =
      await SharedPrefHelper.getBool(SharedPrefKeys.hasSeenOnboarding);
}
