import 'package:flutter/material.dart';
import 'package:flutter_training/model/album_items.dart';
import 'package:flutter_training/theme/app_text_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_padding.dart';

class AlbumItemListWidget extends StatelessWidget {
  final AlbumItems album;

  const AlbumItemListWidget({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppPadding.h120,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppPadding.r12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppPadding.r10,
            offset: Offset(AppPadding.w0, AppPadding.h4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(AppPadding.r12)),
            child: Image.network(
              album.coverImage,
              width: AppPadding.w120,
              height: AppPadding.h120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: AppPadding.all12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    album.name,
                    style: AppTextStyles.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppPadding.vertical4,
                  Text(album.id, style: AppTextStyles.bodyMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
