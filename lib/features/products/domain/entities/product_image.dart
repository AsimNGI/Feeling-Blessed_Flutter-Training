import 'package:equatable/equatable.dart';

class ProductImage extends Equatable {
  const ProductImage({
    required this.id,
    required this.url,
    this.altText,
  });

  final String id;
  final String url;
  final String? altText;

  @override
  List<Object?> get props => [id, url, altText];
}
