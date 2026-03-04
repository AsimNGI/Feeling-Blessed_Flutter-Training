import 'package:flutter/material.dart';

class IconPlusTextWidget extends StatelessWidget {
  /// Can be [IconData] or a [Widget] (like SvgPicture)
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
    this.iconColor = Colors.black,
    this.spacing = 4,
    this.textStyle = const TextStyle(fontSize: 12, color: Color(0xFF475467)),
    this.onTap,
  }) : assert(
         icon is IconData || icon is Widget,
         'icon must be either IconData or Widget',
       );

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    if (icon is IconData) {
      iconWidget = Icon(icon as IconData, size: iconSize, color: iconColor);
    } else if (icon is Widget) {
      iconWidget = icon as Widget;
    } else {
      iconWidget = const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        iconWidget,
        SizedBox(width: spacing),
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Text(text, style: textStyle),
        ),
      ],
    );
  }
}
