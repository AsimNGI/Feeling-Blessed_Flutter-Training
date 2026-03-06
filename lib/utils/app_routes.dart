import 'package:flutter_training/model/album_items.dart';
import 'package:flutter_training/ui/gallery_detail_screen.dart';
import 'package:flutter_training/ui/gallery_screen.dart';
import 'package:flutter_training/ui/my_home.dart';
import 'package:flutter_training/ui/splash.dart';
import 'package:flutter_training/utils/app_paths.dart';
import 'package:flutter_training/utils/app_routes_names.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  final appRoutes = GoRouter(
    initialLocation: AppPaths.splash,
    routes: [
      GoRoute(
        path: AppPaths.splash,
        name: AppRoutesNames.splash,
        builder: (context, state) => const MySplashScreen(),
      ),
      GoRoute(
        path: AppPaths.home,
        name: AppRoutesNames.home,
        builder: (context, state) =>
            MyHomePage(albums: state.extra as List<AlbumItems>),
      ),
      GoRoute(
        path: AppPaths.gallery,
        name: AppRoutesNames.gallery,
        builder: (context, state) =>
            MyGallery(albums: state.extra as List<AlbumItems>),
      ),
      GoRoute(
        path: AppPaths.galleryDetail,
        name: AppRoutesNames.galleryDetail,
        builder: (context, state) =>
            GalleryDetailScreen(albumItems: state.extra as AlbumItems),
      ),
    ],
  );
}
