import 'package:flutter/material.dart';
import 'package:flutter_training/ui/my_home.dart';
import 'package:flutter_training/ui/splash_screen.dart';
import 'package:flutter_training/utils/app_path.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: AppPaths.splash,

    routes: [
      GoRoute(
        path: AppPaths.splash,
        name: AppRoutesName.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // GoRoute(
      //   path: '${AppPaths.home}/:id',
      //   name: AppRoutesName.home,
      //   builder: (context, state) {
      //     final idFromPathParam = state.pathParameters['id'] ?? '';
      //     final idFromQueryParam = state.uri.queryParameters['id'] ?? '';
      //     final idFromExtra = state.extra as String? ?? '';
      //     print('idFromPathParam: $idFromPathParam');
      //     print('idFromQueryParam: $idFromQueryParam');
      //     print('idFromExtra: $idFromExtra');
      //     return MyHomePage(id: idFromExtra);
      //   },
      // ),
      ShellRoute(
        builder: (context, state, child) => MyHomePage(id: state.extra as String? ?? ''),
        routes: [
          GoRoute(
            path: AppPaths.gallery,
            name: AppRoutesName.gallery,
            builder: (context, state) => const MyHomePage(),
          ),
        ],
      ),
    ],
  );
}

class GalleryDetailScreen extends StatelessWidget {
  const GalleryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FlutterLogo());
  }
}
