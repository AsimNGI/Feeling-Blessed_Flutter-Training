import 'package:flutter_training/features/dashboard/domain/entities/response/album_items.dart';

/// Typed extras for GoRouter to avoid unsafe casts.
/// For product detail, pass [ProductDetailRouteArgs] with [productId] to fetch from API.
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

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({required this.productId});
  final String productId;
}
