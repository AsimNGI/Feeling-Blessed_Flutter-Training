import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/core/config/constants/app_colors.dart';
import 'package:flutter_training/core/config/constants/app_padding.dart';
import 'package:flutter_training/core/config/constants/app_strings.dart';
import 'package:flutter_training/core/config/global/theme/app_styles.dart';
import 'package:flutter_training/core/config/routing/app_screens_navigations.dart';
import 'package:flutter_training/features/products/presentation/widgets/product_item_grid_widget.dart';

import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10.h),
        child: Padding(
          padding: AppPadding.appBarPadding,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Text(AppStrings.products, style: s.headlineLarge),
            actions: [
              IconButton(
                onPressed: () =>
                    context.read<ProductsBloc>().add(const LoadProducts()),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return switch (state) {
            ProductsInitial() || ProductsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            ProductsError(:final message) => Center(
                child: Padding(
                  padding: AppPadding.all16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: s.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      AppPadding.vertical16,
                      FilledButton.icon(
                        onPressed: () => context
                            .read<ProductsBloc>()
                            .add(const LoadProducts()),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ProductsLoaded(:final products) => products.isEmpty
                ? Center(
                    child: Text(
                      'No products yet',
                      style: s.bodyLarge
                          .copyWith(color: AppColors.textSecondary),
                    ),
                  )
                : GridView.builder(
                    padding: AppPadding.all16,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 0.71,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) => ProductItemGridWidget(
                      product: products[index],
                      onTap: (product) =>
                          AppScreensNavigations.navigateToProductDetail(
                            context,
                            product,
                          ),
                    ),
                  ),
          };
        },
      ),
    );
  }
}
