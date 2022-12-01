import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import 'widgets/app_scaffold_widget.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider =
    Provider.family<GoRouter, Map<String, Function>>((ref, pages) {
  ref.watch(authProvider);
  final authNotifier = ref.read(authProvider.notifier);

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: LoginPage.routeLocation,
    redirect: (context, state) {
      // If our async state is loading, don't perform redirects, yet
      if (authNotifier.isLoading) return null;

      final isAuth = authNotifier.isAuthenticated;
      final isLoggingIn = state.subloc == LoginPage.routeLocation;

      if (isLoggingIn) return isAuth ? '/' : null;

      return isAuth ? null : LoginPage.routeLocation;
    },
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: LoginPage(authCode: state.queryParams['code']),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffoldWidget(child: child);
        },
        routes: pages
            .map<String, GoRoute>((path, builder) => MapEntry(
                path,
                GoRoute(
                  path: path,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      child: builder(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    );
                  },
                )))
            .values
            .toList(),
      ),
    ],
  );
});
