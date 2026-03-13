import 'package:flutter/material.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_padding.dart';
import 'package:lottie/lottie.dart';

/// Placeholder header section (Android: HeaderSectionWithConfig with Lottie).
/// Replace with your own banner/visual when assets are available.
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'asset/lottie/visual3.json',
      fit: BoxFit.cover,
      width: double.infinity,
      height: AppPadding.h232,
      repeat: true,
      reverse: true,
      filterQuality: FilterQuality.high,
    );
  }
}
