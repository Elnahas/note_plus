import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/routing/app_router.dart';
import '../core/routing/routes.dart';
import '../core/theming/theme.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppString.appName,
            theme: appThemeLight,
            darkTheme: appThemeDark,
            themeMode: ThemeMode.dark,
            onGenerateRoute: appRouter.onGenerateRoute,
            initialRoute: Routes.onBoarding,
            // home: const Scaffold(body: Center(child: Text('Hello World')),),
          );
        });
  }
}
