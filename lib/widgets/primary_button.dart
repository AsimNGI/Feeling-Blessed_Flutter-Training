import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blueColor, AppColors.lightBlueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: fontSize.sp),
        ),
      ),
    );
  }
}
