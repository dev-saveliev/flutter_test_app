import 'package:flutter_test_app/api/model/login_result_model.dart';
import 'package:flutter_test_app/api/model/news_model.dart';
import 'package:flutter_test_app/api/request.dart';

final class NewsRequest implements Request {
  @override
  MethodType type() => MethodType.get;

  @override
  Future<List<NewsModel>> run() {
    return Future.delayed(const Duration(seconds: 3),(){
      return [NewsModel(), NewsModel(), NewsModel()];
    });
  }
}