import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/model/album_items.dart';
import 'package:flutter_training/theme/app_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_padding.dart';

class AlbumItemGridWidget extends StatelessWidget {
  final AlbumItems album;

  const AlbumItemGridWidget({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(10.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            album.coverImage,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (_, __, ___) => const Icon(Icons.error),
          ),
          Positioned(
            bottom: AppPadding.h0,
            left: AppPadding.w0,
            right: AppPadding.w0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: AppPadding.w2,
                  sigmaY: AppPadding.w2,
                ),
                child: Container(
                  height: AppPadding.h50,
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: AppPadding.h25,
            left: AppPadding.w0,
            right: AppPadding.w0,
            child: Text(
              album.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: s.overlayTitle,
            ),
          ),
          Positioned(
            bottom: AppPadding.w8,
            left: AppPadding.w8,
            right: AppPadding.w8,
            child: Text(
              album.id,
              textAlign: TextAlign.center,
              style: s.overlayCaption,
            ),
          ),
        ],
      ),
    );
  }
}
