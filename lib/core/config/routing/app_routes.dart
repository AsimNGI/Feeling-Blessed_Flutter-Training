import 'package:flutter/material.dart';
import 'package:flutter_training/core/config/routing/app_paths.dart';
import 'package:flutter_training/core/config/routing/app_routes_names.dart';
import 'package:flutter_training/core/config/routing/route_extras.dart';
import 'package:flutter_training/features/dashboard/domain/entities/response/album_items.dart';
import 'package:flutter_training/features/dashboard/presentation/view/gallery_detail_screen.dart';
import 'package:flutter_training/features/dashboard/presentation/view/gallery_screen.dart';
import 'package:flutter_training/features/dashboard/presentation/view/my_home.dart';
import 'package:flutter_training/features/splash/presentation/view/splash_mobile_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  final appRoutes = GoRouter(
    initialLocation: AppPaths.splash,
    routes: [
      GoRoute(
        path: AppPaths.splash,
        name: AppRoutesNames.splash,
        builder: (context, state) => const SplashMobileView(),
      ),
      GoRoute(
        path: AppPaths.home,
        name: AppRoutesNames.home,
        builder: (context, state) {
          final args = state.extra;
          final albums = args is HomeRouteArgs
              ? args.albums
              : args is List<AlbumItems>
                  ? args
                  : <AlbumItems>[];
          return MyHomePage(albums: albums);
        },
      ),
      GoRoute(
        path: AppPaths.gallery,
        name: AppRoutesNames.gallery,
        builder: (context, state) {
          final args = state.extra;
          final albums = args is GalleryRouteArgs
              ? args.albums
              : args is List<AlbumItems>
                  ? args
                  : <AlbumItems>[];
          return MyGallery(albums: albums);
        },
      ),
      GoRoute(
        path: AppPaths.galleryDetail,
        name: AppRoutesNames.galleryDetail,
        builder: (context, state) {
          final args = state.extra;
          if (args is GalleryDetailRouteArgs) {
            return GalleryDetailScreen(albumItems: args.album);
          }
          if (args is AlbumItems) {
            return GalleryDetailScreen(albumItems: args);
          }
          return const Scaffold(
            body: Center(child: Text('Invalid gallery detail arguments')),
          );
        },
      ),
    ],
  );
}
