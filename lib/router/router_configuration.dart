import 'package:flutter_test_app/screens/auth/login/login_screen.dart';
import 'package:flutter_test_app/screens/auth/registration/registration_screen.dart';
import 'package:flutter_test_app/screens/intro_screen.dart';
import 'package:flutter_test_app/screens/main_screen.dart';
import 'package:flutter_test_app/screens/test_screen.dart';
import 'package:go_router/go_router.dart';

enum RouteName {
  root,
  login,
  registration,
  main
}

extension RouteNameExtension on RouteName {
  String get path {
    switch (this) {
      case RouteName.root:
        return '/';
      case RouteName.login:
        return '/login';
      case RouteName.registration:
        return '/registration';
      case RouteName.main:
        return '/main';
    }
  }
}

class RouterConfiguration {
  final routes = GoRouter(
    routes: [
      GoRoute(
        path: RouteName.root.path,
//        builder: (context, state) => const IntroScreen(),
        builder: (context, state) => MainScreen(),

//        builder: (context, state) => RegistrationScreen(),
      ),
      GoRoute(
        path: RouteName.login.path,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: RouteName.registration.path,
        builder: (context, state) => RegistrationScreen(),
      ),
      GoRoute(
        path: RouteName.main.path,
        builder: (context, state) => MainScreen(),
      ),

    ],
  );
}