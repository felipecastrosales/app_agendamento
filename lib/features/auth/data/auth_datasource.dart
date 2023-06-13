import 'package:agendamento/core/helpers/result.dart';
import 'package:agendamento/features/auth/data/results/login_failed_result.dart';
import 'package:agendamento/features/auth/models/user.dart';
import 'package:dio/dio.dart';

class AuthDatasource {
  AuthDatasource(this._dio);

  final Dio _dio;

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
