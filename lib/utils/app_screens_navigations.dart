import 'package:flutter/material.dart';
import 'package:flutter_training/model/album_items.dart';
import 'package:flutter_training/utils/app_navigations.dart';
import 'package:flutter_training/utils/app_routes_names.dart';

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
}
