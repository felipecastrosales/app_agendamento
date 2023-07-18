import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agendamento/core/flavor/flavor_config.dart';
import 'core/di/di.dart';
import 'core/route/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

boostrap(
  FlavorConfig flavorConfig,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) {}
  };
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
