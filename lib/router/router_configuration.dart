import 'package:flutter_test_app/screens/intro_screen.dart';
import 'package:flutter_test_app/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

enum RouteName {
  root,
  login
}

extension RouteNameExtension on RouteName {
  String get path {
    switch (this) {
      case RouteName.root:
        return '/';
      case RouteName.login:
        return '/login';
    }
  }
}

class RouterConfiguration {
  final routes = GoRouter(
    routes: [
      GoRoute(
        path: RouteName.root.path,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: RouteName.login.path,
        builder: (context, state) => LoginScreen(),
      ),
    ],
  );
}