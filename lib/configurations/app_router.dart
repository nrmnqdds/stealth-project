import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stealth/features/qibla/qibla_screen.dart';
import 'package:stealth/features/shared/root_screen.dart';
import 'package:stealth/features/shared/splash_screen.dart';
import 'package:stealth/utils/stealth_utils.dart';

/// The route configuration.
final GoRouter stealthAppRouter = GoRouter(
  initialLocation: '/splash',
  navigatorKey: StealthUtils.navigatorKey,
  observers: [
    // GoRouterObserver(),
  ],
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) {
        return RootScreen(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Center(
                child: Text('Coming Soon'),
              ),
            );
          },
        ),
        GoRoute(
          path: '/qibla',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: QiblaScreen(),
            );
          },
        ),
        GoRoute(
          path: '/quran',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Center(
                child: Text('Coming Soon'),
              ),
            );
          },
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Center(
                child: Text('Coming Soon'),
              ),
            );
          },
        ),
      ],
    ),

    // Add more route here
    GoRoute(
      path: '/example',
      builder: (context, state) {
        return const Center(
          child: Text('Coming Soon'),
        );
      },
    ),

    GoRoute(
      path: '/splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
  ],
);
