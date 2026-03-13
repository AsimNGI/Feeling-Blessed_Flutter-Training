import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/core/constants/app_colors.dart';
import 'package:flutter_training/core/constants/app_images_url.dart';
import 'package:flutter_training/core/constants/app_padding.dart';
import 'package:flutter_training/core/global/theme/app_styles.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/album_items.dart';
import 'package:flutter_training/features/dashboard/presentation/widgets/icon_plus_text_widget.dart';

class GalleryDetailScreen extends StatefulWidget {
  final AlbumItems albumItems;

  const GalleryDetailScreen({super.key, required this.albumItems});

  @override
  State<GalleryDetailScreen> createState() => _GalleryDetailScreenState();
}

class _GalleryDetailScreenState extends State<GalleryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: AppPadding.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppPadding.r16),
                child: Image.network(
                  widget.albumItems.coverImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppPadding.vertical24,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: AppPadding.w84,
                  height: AppPadding.h84,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.border),
                    borderRadius: BorderRadius.circular(AppPadding.r16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppPadding.r16),
                    child: Image.network(
                      widget.albumItems.logoImage,
                      fit: BoxFit.fill,
                      width: AppPadding.w84,
                      height: AppPadding.h84,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          width: AppPadding.w84,
                          height: AppPadding.h84,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                              color: AppColors.primary,
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                    ),
                  ),
                ),
                AppPadding.horizontal12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.albumItems.name,
                        style: s.headlineSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AppPadding.vertical12,
                      IconPlusTextWidget(
                        icon: Icons.pin_drop_outlined,
                        text: widget.albumItems.location,
                      ),
                      AppPadding.vertical4,
                      IconPlusTextWidget(
                        icon: SvgPicture.asset(
                          AppImagesUrl.svgWebsite,
                          colorFilter: const ColorFilter.mode(
                            AppColors.iconMuted,
                            BlendMode.srcIn,
                          ),
                          width: AppPadding.w16,
                          height: AppPadding.h16,
                        ),
                        text: widget.albumItems.website,
                        textStyle: s.captionUnderline,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppPadding.vertical24,
            InkWell(
              borderRadius: BorderRadius.circular(AppPadding.r24),
              onTap: () {},
              child: Image.asset(
                AppImagesUrl.imageZakatTag,
                width: AppPadding.w138,
                height: AppPadding.h32,
                fit: BoxFit.fill,
              ),
            ),
            AppPadding.vertical24,
            Text(
              widget.albumItems.description,
              style: s.bodyLarge),
          ],
        ),
      ),
    );
  }
}
