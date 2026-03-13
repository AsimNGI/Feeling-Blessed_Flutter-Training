import 'package:flutter/material.dart';
import 'package:flutter_training/model/home/new_home_models.dart';
import 'package:flutter_training/theme/app_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_padding.dart';

/// Small vertical charity card: logo + name + city. Matches Android [NearbyCharityItem] / [VerticalOrganizationCard].
class NearbyCharityItem extends StatelessWidget {
  const NearbyCharityItem({
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
    final itemWidth = screenWidth * 0.35;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: itemWidth,
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.w16,
          vertical: AppPadding.h16,
        ),
        decoration: BoxDecoration(
          color: AppColors.gray50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.gray200, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.gray200),
                    color: AppColors.white,
                  ),
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  child: charity.logoUrl != null && charity.logoUrl!.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              charity.logoUrl!,
                              fit: BoxFit.contain,
                              width: 52,
                              height: 52,
                              errorBuilder: (_, __, ___) => _iconPlaceholder(),
                            ),
                          ),
                        )
                      : _iconPlaceholder(),
                ),
                SizedBox(height: AppPadding.h8),
                Text(
                  charity.name ?? '',
                  style: AppStyles.of(context).titleXSmall.copyWith(
                        color: AppColors.black,
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            if (charity.cityCountry != null && charity.cityCountry!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  charity.cityCountry!,
                  style: AppStyles.of(context).bodySmall.copyWith(
                        color: AppColors.gray600,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _iconPlaceholder() =>
      Icon(Icons.volunteer_activism, size: 32, color: AppColors.gray600);
}
