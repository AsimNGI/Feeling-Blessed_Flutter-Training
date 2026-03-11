import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/theme/app_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';

class IconPlusTextWidget extends StatelessWidget {
  final dynamic icon;
  final String text;
  final double iconSize;
  final Color iconColor;
  final double spacing;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const IconPlusTextWidget({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 16,
    this.iconColor = AppColors.textPrimary,
    this.spacing = 4,
    this.textStyle,
    this.onTap,
  }) : assert(
         icon is IconData || icon is Widget,
         'icon must be either IconData or Widget',
       );

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    Widget iconWidget;
    if (icon is IconData) {
      iconWidget = Icon(icon as IconData, size: iconSize.r, color: iconColor);
    } else if (icon is Widget) {
      iconWidget = icon as Widget;
    } else {
      iconWidget = const SizedBox.shrink();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconWidget,
        SizedBox(width: spacing.w),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Text(
              text,
              style: textStyle ?? s.bodySmall,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}
