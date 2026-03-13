import 'package:flutter/material.dart';
import 'package:flutter_training/theme/app_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_padding.dart';

/// Section header with title, optional description, and optional arrow – matches Android [SectionHeader].
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.description = '',
    this.showArrow = true,
    this.onArrowTap,
  });

  final String title;
  final String description;
  final bool showArrow;
  final VoidCallback? onArrowTap;

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return Padding(
      padding: AppPadding.screenHorizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: s.titleLarge),
                if (description.isNotEmpty) ...[
                  AppPadding.vertical8,
                  Text(
                    description,
                    style: s.bodyMedium.copyWith(color: AppColors.gray600),
                  ),
                ],
              ],
            ),
          ),
          if (showArrow)
            IconButton(
              onPressed: onArrowTap,
              icon: Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.gray600),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
        ],
      ),
    );
  }
}
