import 'package:flutter_training/core/routing/app_paths.dart';
import 'package:flutter_training/core/routing/app_routes_names.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/album_items.dart';
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
        builder: (context, state) => MyHomePage(albums: state.extra as List<AlbumItems>),
      ),
      GoRoute(
        path: AppPaths.gallery,
        name: AppRoutesNames.gallery,
        builder: (context, state) => MyGallery(albums: state.extra as List<AlbumItems>),
      ),
      GoRoute(
        path: AppPaths.galleryDetail,
        name: AppRoutesNames.galleryDetail,
        builder: (context, state) => GalleryDetailScreen(albumItems: state.extra as AlbumItems),
      ),
    ],
  );
}
