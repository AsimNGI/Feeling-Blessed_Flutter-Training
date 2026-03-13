import 'package:flutter/material.dart';
import 'package:flutter_training/core/constants/app_colors.dart';
import 'package:flutter_training/core/constants/app_padding.dart';
import 'package:flutter_training/core/global/theme/app_styles.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/new_home_models.dart';

/// Large charity card: cover image (4:3) + logo + org name. Matches Android [SuggestedCharityItem].
class SuggestedCharityItem extends StatelessWidget {
  const SuggestedCharityItem({
    super.key,
    required this.charity,
    required this.totalItems,
    this.onTap,
  });

  final OrgInfo charity;
  final int totalItems;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final itemWidth = totalItems > 1 ? screenWidth * 0.60 : screenWidth - 48;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: itemWidth,
        decoration: BoxDecoration(
          color: AppColors.gray50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.gray200, width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _coverImage(charity.coverUrl),
            SizedBox(height: AppPadding.h8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.w8),
              child: Row(
                children: [
                  _logo(charity.logoUrl),
                  SizedBox(width: AppPadding.w8),
                  Expanded(
                    child: Text(
                      charity.name ?? '',
                      style: AppStyles.of(context).titleXSmall.copyWith(color: AppColors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppPadding.h8),
          ],
        ),
      ),
    );
  }

  Widget _coverImage(String? url) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
          color: AppColors.gray200,
        ),
        child: url != null && url.isNotEmpty
            ? ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (_, __, ___) => _placeholder(),
                ),
              )
            : _placeholder(),
      ),
    );
  }

  Widget _placeholder() => const Center(child: Icon(Icons.image_not_supported, size: 48));

  Widget _logo(String? url) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.gray200),
        color: AppColors.white,
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: url != null && url.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  url,
                  fit: BoxFit.contain,
                  width: 34,
                  height: 34,
                  errorBuilder: (_, __, ___) =>
                      Icon(Icons.volunteer_activism, size: 24, color: AppColors.gray600),
                ),
              ),
            )
          : Icon(Icons.volunteer_activism, size: 24, color: AppColors.gray600),
    );
  }
}
