import 'package:flutter/material.dart';
import 'package:flutter_training/core/config/constants/app_colors.dart';
import 'package:flutter_training/core/config/constants/app_padding.dart';
import 'package:flutter_training/core/config/global/theme/app_styles.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';

class ProductDetailInfoSection extends StatelessWidget {
  const ProductDetailInfoSection({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    final hasDescription =
        product.description != null &&
        product.description!.isNotEmpty &&
        product.description!.trim().isNotEmpty;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppPadding.r20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppPadding.w20,
              AppPadding.h24,
              AppPadding.w20,
              AppPadding.h20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.vendor != null && product.vendor!.isNotEmpty) ...[
                  _VendorLabel(text: product.vendor!),
                  AppPadding.vertical8,
                ],
                Text(
                  product.title,
                  style: s.headlineSmall.copyWith(
                    height: 1.25,
                    letterSpacing: -0.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                AppPadding.vertical12,
                Row(
                  children: [
                    if (product.availableForSale == true) ...[
                      _StatusChip(label: 'In stock', isAvailable: true),
                      AppPadding.horizontal8,
                    ],
                    if (product.productType != null &&
                        product.productType!.isNotEmpty)
                      _DetailChip(label: product.productType!, isPrimary: true),
                  ],
                ),
                if (product.tags != null && product.tags!.isNotEmpty) ...[
                  AppPadding.vertical12,
                  Wrap(
                    spacing: AppPadding.w8,
                    runSpacing: AppPadding.h8,
                    children: product.tags!
                        .take(10)
                        .map((tag) => _DetailChip(label: tag, isPrimary: false))
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
          if (hasDescription) ...[
            _SectionDivider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.w20,
                vertical: AppPadding.h24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle(title: 'Description'),
                  AppPadding.vertical8,
                  Text(
                    product.description!.trim(),
                    style: s.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
          _SectionDivider(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.w20,
              vertical: AppPadding.h24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(title: 'Details'),
                AppPadding.vertical16,
                Container(
                  padding: AppPadding.all16,
                  decoration: BoxDecoration(
                    color: AppColors.gray50,
                    borderRadius: BorderRadius.circular(AppPadding.r16),
                    border: Border.all(color: AppColors.border, width: 1),
                  ),
                  child: Column(
                    children: [
                      if (product.totalInventory != null)
                        _InfoRow(
                          icon: Icons.inventory_2_outlined,
                          label: 'Inventory',
                          value: '${product.totalInventory}',
                          style: s,
                        ),
                      if (product.totalInventory != null &&
                          (product.publishedAt != null ||
                              product.updatedAt != null))
                        AppPadding.vertical12,
                      if (product.publishedAt != null)
                        _InfoRow(
                          icon: Icons.calendar_today_outlined,
                          label: 'Published',
                          value: _formatDate(product.publishedAt!),
                          style: s,
                        ),
                      if (product.publishedAt != null &&
                          product.updatedAt != null)
                        AppPadding.vertical12,
                      if (product.updatedAt != null)
                        _InfoRow(
                          icon: Icons.update_outlined,
                          label: 'Last updated',
                          value: _formatDate(product.updatedAt!),
                          style: s,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (product.onlineStoreUrl != null &&
              product.onlineStoreUrl!.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppPadding.w20,
                0,
                AppPadding.w20,
                AppPadding.h32,
              ),
              child: SizedBox(
                width: double.infinity,
                height: AppPadding.h52,
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.open_in_new_rounded, size: AppPadding.r20),
                  label: Text(
                    'View on store',
                    style: s.titleMedium.copyWith(
                      color: AppColors.textOnDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textOnDark,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppPadding.r14),
                    ),
                  ),
                ),
              ),
            ),
          ] else
            AppPadding.vertical24,
        ],
      ),
    );
  }

  static String _formatDate(String iso) {
    try {
      final dt = DateTime.tryParse(iso);
      if (dt != null) {
        const months = [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ];
        return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
      }
    } catch (_) {}
    return iso;
  }
}

class _VendorLabel extends StatelessWidget {
  const _VendorLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return Text(
      text.toUpperCase(),
      style: s.bodySmall.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.isAvailable});

  final String label;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.w8,
        vertical: AppPadding.h5,
      ),
      decoration: BoxDecoration(
        color: isAvailable ? AppColors.secondaryGreen50 : AppColors.red50,
        borderRadius: BorderRadius.circular(AppPadding.r8),
      ),
      child: Text(
        label,
        style: AppStyles.of(context).caption.copyWith(
          color: isAvailable ? AppColors.secondaryGreen700 : AppColors.red600,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  const _DetailChip({required this.label, required this.isPrimary});

  final String label;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.w12,
        vertical: AppPadding.h6,
      ),
      decoration: BoxDecoration(
        color: isPrimary
            ? AppColors.primary.withValues(alpha: 0.1)
            : AppColors.gray100,
        borderRadius: BorderRadius.circular(AppPadding.r10),
      ),
      child: Text(
        label,
        style: s.bodySmall.copyWith(
          color: isPrimary ? AppColors.primary : AppColors.textSecondary,
          fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return Text(
      title,
      style: s.titleMedium.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColors.divider,
      indent: AppPadding.w20,
      endIndent: AppPadding.w20,
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.style,
  });

  final IconData icon;
  final String label;
  final String value;
  final AppStyles style;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: AppPadding.all6,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppPadding.r8),
            border: Border.all(color: AppColors.border),
          ),
          child: Icon(icon, size: AppPadding.r18, color: AppColors.iconMuted),
        ),
        SizedBox(width: AppPadding.w12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: style.caption),
              AppPadding.vertical2,
              Text(value, style: style.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
