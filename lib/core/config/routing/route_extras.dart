import 'package:flutter_training/features/dashboard/domain/entities/response/album_items.dart';

/// Typed extras for GoRouter to avoid unsafe casts.
class HomeRouteArgs {
  const HomeRouteArgs({this.albums = const []});
  final List<AlbumItems> albums;
}

class GalleryRouteArgs {
  const GalleryRouteArgs({this.albums = const []});
  final List<AlbumItems> albums;
}

class GalleryDetailRouteArgs {
  const GalleryDetailRouteArgs({required this.album});
  final AlbumItems album;
}
