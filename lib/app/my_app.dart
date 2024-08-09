import 'package:flutter/material.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/routing/app_router.dart';

import '../core/routing/routes.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter ;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
      initialRoute: Routes.home,
      // home: const Scaffold(body: Center(child: Text('Hello World')),),
    );
  }
}