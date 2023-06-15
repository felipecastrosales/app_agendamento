import 'package:agendamento/core/flavor/flavor_config.dart';
import 'package:agendamento/core/helpers/token_interceptor.dart';
import 'package:agendamento/features/auth/data/auth_datasource.dart';
import 'package:agendamento/features/auth/data/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

void configureDependencies(FlavorConfig flavorConfig) {
  getIt.registerSingleton<FlavorConfig>(flavorConfig);
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://parseapi.back4app.com/functions',
        headers: {
          'X-Parse-Application-Id': flavorConfig.appId,
          'X-Parse-REST-API-Key': flavorConfig.restKey,
        },
      ),
    )..interceptors.addAll(
        [
          TokenInterceptor(),
          if (flavorConfig.flavor == AppFlavor.dev)
            PrettyDioLogger(requestHeader: true, responseBody: true),
        ],
      ),
  );

  getIt.registerLazySingleton<AuthDatasource>(
    () => AuthDatasource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<AuthDatasource>()),
  );
}
