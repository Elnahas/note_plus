import 'package:flutter/material.dart';
import 'package:note_plus/app/my_app.dart';
import 'package:note_plus/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp( MyApp(appRouter: AppRouter()));
}