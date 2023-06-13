import 'package:flutter/material.dart';
import 'package:agendamento/core/flavor/flavor_config.dart';
import 'core/di/di.dart';
import 'core/route/app_routes.dart';

boostrap(
  FlavorConfig flavorConfig,
) {
  configureDependencies(flavorConfig);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Agendamento',
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    );
  }
}
