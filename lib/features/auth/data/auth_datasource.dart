import 'package:agendamento/features/auth/models/user.dart';
import 'package:dio/dio.dart';

class AuthDatasource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://parseapi.back4app.com/functions',
      headers: {
        'X-Parse-Application-Id': 'uQlXMWlcc8sZic6jfDu26WxC938Vg8pvS6O9pE7S',
        'X-Parse-REST-API-Key': 'rAIV5OqJ2qbqdy85sd4XYkroT6ryOWDQGoplCg0a',
      },
    ),
  );

  Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/v1/sign-in',
        data: {
          'username': email,
          'password': password,
        },
      );

      return User.fromMap(response.data['result']);
    } on DioError {
      rethrow;
    }
  }
}
