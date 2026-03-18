import 'package:equatable/equatable.dart';
import 'package:flutter_training/features/products/domain/entities/product_image.dart';

class Product extends Equatable {
  const Product({
    required this.productId,
    this.availableForSale,
    this.createdAt,
    this.description,
    this.descriptionHtml,
    this.handle,
    this.isGiftCard,
    this.onlineStoreUrl,
    this.productType,
    this.publishedAt,
    this.requiresSellingPlan,
    this.tags,
    required this.title,
    this.totalInventory,
    this.trackingParameters,
    this.updatedAt,
    this.vendor,
    this.images,
  });

  final String productId;
  final bool? availableForSale;
  final String? createdAt;
  final String? description;
  final String? descriptionHtml;
  final String? handle;
  final bool? isGiftCard;
  final String? onlineStoreUrl;
  final String? productType;
  final String? publishedAt;
  final bool? requiresSellingPlan;
  final List<String>? tags;
  final String title;
  final int? totalInventory;
  final String? trackingParameters;
  final String? updatedAt;
  final String? vendor;
  final List<ProductImage>? images;

  @override
  List<Object?> get props => [
        productId,
        availableForSale,
        createdAt,
        description,
        descriptionHtml,
        handle,
        isGiftCard,
        onlineStoreUrl,
        productType,
        publishedAt,
        requiresSellingPlan,
        tags,
        title,
        totalInventory,
        trackingParameters,
        updatedAt,
        vendor,
        images,
      ];
}
