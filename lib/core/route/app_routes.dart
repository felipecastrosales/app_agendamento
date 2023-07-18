import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => Container(),
  redirect: (context, state) {
    final uri = Uri(
      // path: state.location,
      // queryParameters: state.queryParameters,

      path: '/courses/:id',
      queryParameters: {
        'url': 'https://google.com',
      },
    );
    debugPrint(uri.toString());
    if (state.location == '/auth') {
      return '/auth/1?name=John&age=30';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => Container(color: Colors.yellow),
      builder: (context, state) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                throw Exception();
              },
              child: const Text('throw Exception'),
            ),
            TextButton(
              onPressed: () {
                FirebaseCrashlytics.instance.crash();
              },
              child: const Text('crash'),
            ),
          ],
        ),
      ),
    ),
    GoRoute(
      // path: '/auth/:id?name&age=0',
      path: '/auth',
      builder: (context, state) {
        state.pathParameters['id'];
        // state.queryParameters['name'];
        // state.queryParameters['age'];
        return Container(color: Colors.green);
      },
    ),
  ],
);
