import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_plus/core/routing/routes.dart';
import 'package:note_plus/features/add_task/ui/screen/add_task_screen.dart';
import 'package:note_plus/features/home/ui/screen/home_screen.dart';

import '../../features/on_boarding/logic/on_boarding_cubit.dart';
import '../../features/on_boarding/ui/screen/on_boarding_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingScreen(),
          ),
        );

      case Routes.addTask:
        return MaterialPageRoute(
          builder: (context) => const AddTaskScreen(),
        );

      default:
        return null;
    }
  }
}
