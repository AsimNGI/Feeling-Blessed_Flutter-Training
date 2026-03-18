class ProductImageDto {
  ProductImageDto({this.id, this.url, this.altText});

  factory ProductImageDto.fromJson(Map<String, dynamic> json) {
    return ProductImageDto(
      id: json['id'] as String?,
      url: json['url'] as String?,
      altText: json['altText'] as String?,
    );
  }

  final String? id;
  final String? url;
  final String? altText;
}

class ProductDto {
  ProductDto({
    this.productId,
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
    this.title,
    this.totalInventory,
    this.trackingParameters,
    this.updatedAt,
    this.vendor,
    this.images,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    final node = json;
    final imagesData = node['images'] as Map<String, dynamic>?;
    final nodes = imagesData?['nodes'] as List<dynamic>?;
    final imageDtos = nodes
        ?.map((e) => ProductImageDto.fromJson(e as Map<String, dynamic>))
        .toList();

    return ProductDto(
      productId: node['product_id'] as String? ?? node['id'] as String?,
      availableForSale: node['availableForSale'] as bool?,
      createdAt: node['createdAt'] as String?,
      description: node['description'] as String?,
      descriptionHtml: node['descriptionHtml'] as String?,
      handle: node['handle'] as String?,
      isGiftCard: node['isGiftCard'] as bool?,
      onlineStoreUrl: node['onlineStoreUrl'] as String?,
      productType: node['productType'] as String?,
      publishedAt: node['publishedAt'] as String?,
      requiresSellingPlan: node['requiresSellingPlan'] as bool?,
      tags: (node['tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      title: node['title'] as String? ?? '',
      totalInventory: node['totalInventory'] as int?,
      trackingParameters: node['trackingParameters'] as String?,
      updatedAt: node['updatedAt'] as String?,
      vendor: node['vendor'] as String?,
      images: imageDtos,
    );
  }

  final String? productId;
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
  final String? title;
  final int? totalInventory;
  final String? trackingParameters;
  final String? updatedAt;
  final String? vendor;
  final List<ProductImageDto>? images;
}
