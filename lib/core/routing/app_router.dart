import 'package:flutter/material.dart';
import 'package:note_plus/core/routing/routes.dart';

import '../../features/on_boarding/ui/on_boarding/ui/screen/on_boarding_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const Center(child: Text('Home Screen')),
        );

      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      default:
        return null;
    }
  }
}
