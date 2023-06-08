import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  // final AuthRepository authRepository = AuthRepository();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Parse-Session-Token'] = '';
    handler.next(options);
    // authRepository.user?.sessionToken;
  }
}
