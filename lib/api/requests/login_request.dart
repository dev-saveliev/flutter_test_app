import 'package:flutter_test_app/api/model/login_result_model.dart';
import 'package:flutter_test_app/api/request.dart';

final class LoginRequest implements Request {
  @override
  MethodType type() => MethodType.get;

  @override
  Future<LoginResultModel> run() {
    return Future.delayed(const Duration(seconds: 3),(){
      return LoginResultModel();
    });
  }
}