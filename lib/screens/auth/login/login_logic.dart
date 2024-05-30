import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/api/requests/login_request.dart';

final class LoginLogic {

  final onLoginProvider = StateProvider<bool>((ref) {
    return false;
  });

  void login({required String login, required String password, required WidgetRef ref}) async {
    final request = LoginRequest();
    await request.run();

    ref.read(onLoginProvider.notifier).state = true;
    ref.read(onLoginProvider.notifier).state = false;
  }
}