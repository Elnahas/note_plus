import 'package:flutter/material.dart';
import 'package:note_plus/core/routing/routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const Center(child: Text('Home Screen')),
                );
      default:
        return null;
    }
  }
}
