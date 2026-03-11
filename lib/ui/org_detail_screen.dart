import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/model/organization.dart';
import 'package:flutter_training/theme/app_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_images_url.dart';
import 'package:flutter_training/utils/app_padding.dart';
import 'package:flutter_training/utils/app_strings.dart';

import '../widgets/icon_plus_text_widget.dart';

const int _kDescriptionMaxLines = 4;

/// Returns true if [text] with [style] exceeds [maxLines] when laid out in [maxWidth].
bool _textExceedsMaxLines(
  String text,
  TextStyle style,
  double maxWidth,
  int maxLines,
) {
  final painter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  );
  painter.layout(maxWidth: maxWidth);
  return painter.didExceedMaxLines;
}

class OrgDetailScreen extends StatefulWidget {
  final Organization org;

  const OrgDetailScreen({super.key, required this.org});

  @override
  State<OrgDetailScreen> createState() => _OrgDetailScreenState();
}

class _OrgDetailScreenState extends State<OrgDetailScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final org = widget.org;
    final description = AppStrings.organizationDetails;
    final s = AppStyles.of(context);
    final descriptionStyle = s.bodyLarge;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: AppPadding.screen,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final hasOverflow = _textExceedsMaxLines(
              description,
              descriptionStyle,
              maxWidth,
              _kDescriptionMaxLines,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppPadding.r16),
                    child: Image.asset(org.coverImagePath, fit: BoxFit.cover),
                  ),
                ),
                AppPadding.vertical24,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 84.w,
                      height: 84.h,
                      padding: AppPadding.all8,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.border),
                        borderRadius: BorderRadius.circular(AppPadding.r16),
                      ),
                      child: Image.asset(org.logoPath, fit: BoxFit.contain),
                    ),
                    AppPadding.horizontal12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            org.name,
                            style: s.headlineSmall,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppPadding.vertical12,
                          IconPlusTextWidget(
                            icon: Icons.pin_drop_outlined,
                            text: org.location,
                          ),
                          AppPadding.vertical4,
                          IconPlusTextWidget(
                            icon: SvgPicture.asset(
                              AppImagesUrl.svgWebsite,
                              colorFilter: const ColorFilter.mode(
                                AppColors.iconMuted,
                                BlendMode.srcIn,
                              ),
                              width: 16.w,
                              height: 16.h,
                            ),
                            text: org.website,
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
                    width: 138.w,
                    height: 32.h,
                    fit: BoxFit.fill,
                  ),
                ),
                AppPadding.vertical24,
                Text(
                  description,
                  style: descriptionStyle,
                  maxLines: hasOverflow && !_isExpanded
                      ? _kDescriptionMaxLines
                      : null,
                  overflow: hasOverflow && !_isExpanded
                      ? TextOverflow.ellipsis
                      : null,
                ),
                if (hasOverflow) ...[
                  AppPadding.vertical24,
                  InkWell(
                    onTap: () => setState(() => _isExpanded = !_isExpanded),
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          AppColors.backgroundGradientStart,
                          AppColors.backgroundGradientEnd,
                        ],
                      ).createShader(bounds),
                      blendMode: BlendMode.srcIn,
                      child: Padding(
                        padding: AppPadding.only(top: 8.h, bottom: 8.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _isExpanded ? "Read less" : "Read more",
                              style: s.buttonSmall.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              _isExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                AppPadding.vertical24,
                Text(AppStrings.charityDetails, style: s.titleMedium),
                AppPadding.vertical24,
                IconPlusTextWidget(
                  icon: SvgPicture.asset(
                    AppImagesUrl.svgWebsite,
                    colorFilter: const ColorFilter.mode(
                      AppColors.textSecondary,
                      BlendMode.srcIn,
                    ),
                    width: 20.w,
                    height: 20.h,
                  ),
                  spacing: AppPadding.w16,
                  text: org.website,
                  textStyle: s.bodyUnderline,
                ),
                AppPadding.vertical24,
                IconPlusTextWidget(
                  icon: Icons.phone_outlined,
                  iconSize: AppPadding.r20,
                  spacing: AppPadding.w16,
                  text: org.phone,
                  textStyle: s.bodyLarge,
                ),
                AppPadding.vertical24,
                IconPlusTextWidget(
                  icon: Icons.email_outlined,
                  iconSize: AppPadding.r20,
                  spacing: AppPadding.w16,
                  text: org.email,
                  textStyle: s.bodyUnderline,
                ),
                AppPadding.vertical24,
                IconPlusTextWidget(
                  icon: Icons.email_outlined,
                  iconSize: AppPadding.r20,
                  spacing: AppPadding.w16,
                  text: org.etnNumber,
                  textStyle: s.bodyUnderline,
                ),
                AppPadding.vertical32,
                Divider(color: AppColors.border),
                AppPadding.vertical32,
                Text(AppStrings.impactByThisCharity, style: s.titleMedium),
                AppPadding.vertical24,
                Text(AppStrings.impactByThisCharity, style: s.titleXSmall),
              ],
            );
          },
        ),
      ),
    );
  }
}
