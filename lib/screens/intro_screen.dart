import 'package:flutter/material.dart';
import 'package:flutter_test_app/router/router_configuration.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(RouteName.login.path),
          child: const Text('Next page'),
        ),
      ),
    );
  }
}
