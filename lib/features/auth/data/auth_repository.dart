import 'package:agendamento/core/helpers/result.dart';
import 'package:agendamento/features/auth/data/auth_datasource.dart';
import 'package:agendamento/features/auth/data/results/login_failed_result.dart';
import 'package:agendamento/features/auth/models/user.dart';

class AuthRepository {
  final AuthDatasource _authDataSource = AuthDatasource();
  User? user;

  Future<Result<LoginFailedResult, User>> login({
    required String email,
    required String password,
  }) async {
    final result = await _authDataSource.login(
      email: email,
      password: password,
    );

    if (result case Success(object: final user)) {
      this.user = user;
    }

    return result;
  }
}
