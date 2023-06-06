import 'package:agendamento/features/auth/data/auth_datasource.dart';
import 'package:agendamento/features/auth/models/user.dart';

class AuthRepository {
  final AuthDatasource _authDataSource = AuthDatasource();

  Future<User> login({
    required String email,
    required String password,
  }) {
    return _authDataSource.login(email: email, password: password);
  }
}
