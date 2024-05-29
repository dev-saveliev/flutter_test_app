import 'package:flutter_test_app/api/model/login_response.dart';
import 'package:flutter_test_app/api/request.dart';

final class LoginRequest implements Request {
  @override
  MethodType type() => MethodType.get;

  @override
  Future<LoginResponse> run() {
    return Future.delayed(const Duration(seconds: 3),(){
      return LoginResponse();
    });
  }
}