import 'package:flutter_training/features/products/queries/product_queries.dart';
import 'package:flutter_training/core/data/network/graphql_client.dart';
import 'package:flutter_training/core/data/network/remote.dart';
import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/products/data/models/product_dto.dart';
import 'package:flutter_training/features/products/domain/contracts/products_contract.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';
import 'package:flutter_training/features/products/domain/entities/product_image.dart';
import 'package:flutter_training/features/products/domain/queries/get_product_query.dart';

class ProductsContractImpl implements ProductsContract {
  ProductsContractImpl(this._dataSource);

  final IRemoteDataSource<GraphQLService> _dataSource;

  Product _mapDtoToProduct(ProductDto dto, List<ProductImage>? images) {
    return Product(
      productId: dto.productId!,
      availableForSale: dto.availableForSale,
      createdAt: dto.createdAt,
      description: dto.description,
      descriptionHtml: dto.descriptionHtml,
      handle: dto.handle,
      isGiftCard: dto.isGiftCard,
      onlineStoreUrl: dto.onlineStoreUrl,
      productType: dto.productType,
      publishedAt: dto.publishedAt,
      requiresSellingPlan: dto.requiresSellingPlan,
      tags: dto.tags,
      title: dto.title!,
      totalInventory: dto.totalInventory,
      trackingParameters: dto.trackingParameters,
      updatedAt: dto.updatedAt,
      vendor: dto.vendor,
      images: images,
    );
  }

  @override
  Future<DataState<List<Product>>> getProducts() async {
    try {
      final result = await _dataSource.source.performQuery(
        getProductsQuery,
      );

      if (result.hasException) {
        return Error<List<Product>>(
          result.exception?.toString() ?? 'GraphQL request failed',
        );
      }

      final data = result.data;
      if (data == null) {
        return Error<List<Product>>('Invalid response: missing data');
      }
      final productsData = data['products'] as Map<String, dynamic>?;
      if (productsData == null) {
        return Success<List<Product>>([]);
      }

      final edges = productsData['edges'] as List<dynamic>?;
      if (edges == null || edges.isEmpty) {
        return Success<List<Product>>([]);
      }

      final products = <Product>[];
      for (final edge in edges) {
        final map = edge as Map<String, dynamic>?;
        final node = map?['node'] as Map<String, dynamic>?;
        if (node != null) {
          final dto = ProductDto.fromJson(node);
          if (dto.productId != null && dto.title != null) {
            final images = dto.images
                ?.where((img) => img.id != null && img.url != null)
                .map((img) => ProductImage(
                      id: img.id!,
                      url: img.url!,
                      altText: img.altText,
                    ))
                .toList();
            products.add(_mapDtoToProduct(dto, images));
          }
        }
      }

      return Success<List<Product>>(products);
    } catch (e) {
      return Error<List<Product>>(e.toString());
    }
  }

  @override
  Future<DataState<Product>> getProductById(String id) async {
    try {
      final result = await _dataSource.source.performQueryWithParams(
        query: GraphQLQueries.getProductByIdQuery,
        params: {'id': id},
      );

      if (result.hasException) {
        return Error<Product>(
          result.exception?.toString() ?? 'GraphQL request failed',
        );
      }

      final data = result.data;
      if (data == null) {
        return Error<Product>('Invalid response: missing data');
      }

      final productNode = data['product'];
      if (productNode == null) {
        return Error<Product>('Product not found');
      }
      if (productNode is! Map<String, dynamic>) {
        return Error<Product>('Invalid product response');
      }

      final dto = ProductDto.fromJson(productNode);
      if (dto.productId == null || dto.title == null) {
        return Error<Product>('Invalid product data');
      }

      final images = dto.images
          ?.where((img) => img.id != null && img.url != null)
          .map((img) => ProductImage(
                id: img.id!,
                url: img.url!,
                altText: img.altText,
              ))
          .toList();

      return Success<Product>(_mapDtoToProduct(dto, images));
    } catch (e) {
      return Error<Product>(e.toString());
    }
  }
}
