import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/core/config/constants/app_colors.dart';
import 'package:flutter_training/core/config/constants/app_padding.dart';
import 'package:flutter_training/features/products/presentation/widgets/product_detail_image_section.dart';
import 'package:flutter_training/features/products/presentation/widgets/product_detail_info_section.dart';

import '../bloc/product_detail_bloc.dart';
import '../bloc/product_detail_event.dart';
import '../bloc/product_detail_state.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return switch (state) {
          ProductDetailInitial() || ProductDetailLoading() => _buildScaffold(
            context,
            body: const Center(child: CircularProgressIndicator()),
          ),
          ProductDetailError(:final message) => _buildScaffold(
            context,
            body: Center(
              child: Padding(
                padding: AppPadding.all24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    AppPadding.vertical24,
                    FilledButton.icon(
                      onPressed: () => context.read<ProductDetailBloc>().add(
                        LoadProductDetail(productId),
                      ),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ProductDetailLoaded(:final product) => _buildContent(
            context,
            product,
          ),
        };
      },
    );
  }

  Widget _buildScaffold(BuildContext context, {required Widget body}) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        leading: _AppBarButton(
          icon: Icons.arrow_back_rounded,
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          _AppBarButton(icon: Icons.share_rounded, onPressed: _noop),
        ],
      ),
      body: body,
    );
  }

  static void _noop() {}

  Widget _buildContent(BuildContext context, product) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverAppBar(
            expandedHeight: AppPadding.h360,
            pinned: true,
            backgroundColor: AppColors.surface,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: _AppBarButton(
              icon: Icons.arrow_back_rounded,
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: const [
              _AppBarButton(icon: Icons.share_rounded, onPressed: _noop),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: ProductDetailImageSection(images: product.images),
            ),
          ),
          SliverToBoxAdapter(child: ProductDetailInfoSection(product: product)),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.all8,
      child: Material(
        color: AppColors.white.withValues(alpha: 0.9),
        shape: const CircleBorder(),
        elevation: 1,
        child: IconButton(
          icon: Icon(icon, size: AppPadding.r22),
          onPressed: onPressed,
          style: IconButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            padding: AppPadding.all10,
          ),
        ),
      ),
    );
  }
}
