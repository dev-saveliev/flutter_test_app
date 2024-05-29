enum MethodType {
  get, post
}

abstract class Request<T> {
  MethodType type();

  Future<T?> run();
}