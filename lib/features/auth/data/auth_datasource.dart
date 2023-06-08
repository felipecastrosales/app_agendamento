import 'package:agendamento/core/helpers/result.dart';
import 'package:agendamento/core/helpers/token_interceptor.dart';
import 'package:agendamento/features/auth/data/results/login_failed_result.dart';
import 'package:agendamento/features/auth/models/user.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AuthDatasource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://parseapi.back4app.com/functions',
      headers: {
        'X-Parse-Application-Id': 'uQlXMWlcc8sZic6jfDu26WxC938Vg8pvS6O9pE7S',
        'X-Parse-REST-API-Key': 'rAIV5OqJ2qbqdy85sd4XYkroT6ryOWDQGoplCg0a',
      },
    ),
  )..interceptors.addAll(
      [
        TokenInterceptor(),
        PrettyDioLogger(requestHeader: true, responseBody: true),
      ],
    );

  Future<Result<LoginFailedResult, User>> login({
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

      return Success(
        User.fromMap(response.data['result']),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        return const Failure(LoginFailedResult.unknownError);
      }
      return const Failure(LoginFailedResult.unknownError);
    } catch (_) {
      return const Failure(LoginFailedResult.unknownError);
    }
  }
}
