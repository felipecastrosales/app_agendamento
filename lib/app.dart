import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
  FirebaseCrashlytics.instance.setCustomKey('isPremium', true);
  FirebaseCrashlytics.instance.setCustomKey('isTempPremium', true);
  FirebaseCrashlytics.instance.setCustomKey('userId', '123456789');
  FirebaseCrashlytics.instance.log('Boom 💥');
  FirebaseCrashlytics.instance.setUserIdentifier('123456789');

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
