import 'package:flutter/material.dart';
import 'package:flutter_training/core/config/constants/app_colors.dart';
import 'package:flutter_training/core/config/constants/app_padding.dart';
import 'package:flutter_training/core/config/global/theme/app_styles.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';

class ProductItemGridWidget extends StatelessWidget {
  const ProductItemGridWidget({
    super.key,
    required this.product,
    this.onTap,
  });

  final Product product;
  final void Function(Product)? onTap;

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return InkWell(
      onTap: onTap != null ? () => onTap!(product) : null,
      borderRadius: BorderRadius.circular(AppPadding.r12),
      child: Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppPadding.r12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppPadding.r12)),
            child: AspectRatio(aspectRatio: 1, child: _buildProductImage()),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.w12,
                vertical: AppPadding.h8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title,
                    style: s.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  if (product.vendor != null && product.vendor!.isNotEmpty) ...[
                    SizedBox(height: AppPadding.h2),
                    Text(
                      product.vendor!,
                      style: s.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildProductImage() {
    final imageUrl =
        product.images != null &&
            product.images!.isNotEmpty &&
            product.images!.first.url.isNotEmpty
        ? product.images!.first.url
        : null;
    if (imageUrl != null) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: AppColors.gray100,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }
    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      color: AppColors.gray100,
      child: Icon(
        Icons.inventory_2_outlined,
        size: AppPadding.r48,
        color: AppColors.gray400,
      ),
    );
  }
}
