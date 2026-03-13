import 'package:flutter/material.dart';
import 'package:flutter_training/core/routing/app_navigations.dart';
import 'package:flutter_training/core/routing/app_routes_names.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/album_items.dart';

class AppScreensNavigations {
  static void navigateToHome(BuildContext context, List<AlbumItems> albums) {
    AppNavigation.replaceToNewScreen(context: context, path: AppRoutesNames.home, args: albums);
  }

  static void navigateToGalleryDetail(BuildContext context, AlbumItems album) {
    AppNavigation.navigateToNewScreen(
      context: context,
      path: AppRoutesNames.galleryDetail,
      args: album,
    );
  }
}
