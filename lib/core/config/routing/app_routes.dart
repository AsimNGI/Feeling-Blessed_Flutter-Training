import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/core/config/routing/app_paths.dart';
import 'package:flutter_training/core/config/routing/app_routes_names.dart';
import 'package:flutter_training/core/config/routing/route_extras.dart';
import 'package:flutter_training/features/dashboard/domain/entities/response/album_items.dart';
import 'package:flutter_training/features/dashboard/presentation/view/gallery_detail_screen.dart';
import 'package:flutter_training/features/dashboard/presentation/view/gallery_screen.dart';
import 'package:flutter_training/features/dashboard/presentation/view/my_home.dart';
import 'package:flutter_training/core/config/di/di.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';
import 'package:flutter_training/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:flutter_training/features/products/presentation/view/product_detail_screen.dart';
import 'package:flutter_training/features/splash/presentation/view/splash_mobile_view.dart';
import 'package:go_router/go_router.dart';

import '../../../features/products/presentation/bloc/product_detail_bloc.dart';
import '../../../features/products/presentation/bloc/product_detail_event.dart';

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
      GoRoute(
        path: AppPaths.productDetail,
        name: AppRoutesNames.productDetail,
        builder: (context, state) {
          final args = state.extra;
          final productId = args is ProductDetailRouteArgs
              ? args.productId
              : args is Product
                  ? args.productId
                  : args is String
                      ? args
                      : null;
          if (productId == null || productId.isEmpty) {
            return const Scaffold(
              body: Center(child: Text('Invalid product detail arguments')),
            );
          }
          return BlocProvider(
            create: (_) => ProductDetailBloc(sl<GetProductByIdUseCase>())
              ..add(LoadProductDetail(productId)),
            child: ProductDetailScreen(productId: productId),
          );
        },
      ),
    ],
  );
}
