import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/core/config/constants/app_colors.dart';
import 'package:flutter_training/core/config/constants/app_padding.dart';
import 'package:flutter_training/features/products/domain/entities/product_image.dart';

class ProductDetailImageSection extends StatefulWidget {
  const ProductDetailImageSection({super.key, this.images});

  final List<ProductImage>? images;

  @override
  State<ProductDetailImageSection> createState() =>
      _ProductDetailImageSectionState();
}

class _ProductDetailImageSectionState extends State<ProductDetailImageSection> {
  int _currentPage = 0;

  static const double _sectionHeight = 360;

  @override
  Widget build(BuildContext context) {
    final urls =
        widget.images
            ?.where((img) => img.url.isNotEmpty)
            .map((e) => e.url)
            .toList() ??
        [];

    if (urls.isEmpty) {
      return _placeholder();
    }

    if (urls.length == 1) {
      return Stack(
        fit: StackFit.expand,
        children: [_buildSingleImage(urls.first), _buildGradientOverlay()],
      );
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: _sectionHeight.h,
          child: PageView.builder(
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemCount: urls.length,
            itemBuilder: (context, index) => Stack(
              fit: StackFit.expand,
              children: [
                _buildSingleImage(urls[index]),
                _buildGradientOverlay(),
              ],
            ),
          ),
        ),
        _buildPageIndicator(urls.length),
      ],
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 120.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.black.withValues(alpha: 0.15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int count) {
    return Padding(
      padding: AppPadding.only(bottom: AppPadding.h20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
          (i) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: AppPadding.w4),
            width: _currentPage == i ? AppPadding.w24 : AppPadding.w8,
            height: AppPadding.h8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPadding.r4),
              color: _currentPage == i
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: 0.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.2),
                  blurRadius: AppPadding.r4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSingleImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: AppColors.gray100,
          child: Center(
            child: SizedBox(
              width: AppPadding.w40,
              height: AppPadding.h40,
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
                color: AppColors.primary,
                strokeWidth: AppPadding.r2,
              ),
            ),
          ),
        );
      },
      errorBuilder: (_, __, ___) => _placeholder(),
    );
  }

  Widget _placeholder() {
    return Container(
      height: _sectionHeight.h,
      color: AppColors.gray100,
      child: Center(
        child: Icon(
          Icons.inventory_2_outlined,
          size: AppPadding.r72,
          color: AppColors.gray400,
        ),
      ),
    );
  }
}
