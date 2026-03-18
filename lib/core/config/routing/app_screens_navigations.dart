import 'package:flutter/material.dart';
import 'package:flutter_training/core/config/routing/app_navigations.dart';
import 'package:flutter_training/core/config/routing/app_routes_names.dart';
import 'package:flutter_training/features/dashboard/domain/entities/response/album_items.dart';
import 'package:flutter_training/core/config/routing/route_extras.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';

class AppScreensNavigations {
  static void navigateToHome(BuildContext context, List<AlbumItems> albums) {
    AppNavigation.replaceToNewScreen(
      context: context,
      path: AppRoutesNames.home,
      args: albums,
    );
  }

  static void navigateToGalleryDetail(BuildContext context, AlbumItems album) {
    AppNavigation.navigateToNewScreen(
      context: context,
      path: AppRoutesNames.galleryDetail,
      args: album,
    );
  }

  /// Navigate to product detail by [Product]; fetches full details by id via API.
  static void navigateToProductDetail(BuildContext context, Product product) {
    AppNavigation.navigateToNewScreen(
      context: context,
      path: AppRoutesNames.productDetail,
      args: ProductDetailRouteArgs(productId: product.productId),
    );
  }

  /// Navigate to product detail by [productId]; fetches details via API.
  static void navigateToProductDetailById(BuildContext context, String productId) {
    AppNavigation.navigateToNewScreen(
      context: context,
      path: AppRoutesNames.productDetail,
      args: ProductDetailRouteArgs(productId: productId),
    );
  }
}
