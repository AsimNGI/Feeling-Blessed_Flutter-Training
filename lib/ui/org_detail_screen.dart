import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/model/organization.dart';
import 'package:flutter_training/theme/app_text_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_constant.dart';
import 'package:flutter_training/utils/app_padding.dart';
import 'package:flutter_training/utils/app_strings.dart';

import '../widgets/icon_plus_text_widget.dart';

class OrgDetailScreen extends StatelessWidget {
  // 3. Pass data via constructor
  final Organization org;

  const OrgDetailScreen({super.key, required this.org});

  @override
  Widget build(BuildContext context) {
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
                        style: AppTextStyles.headlineSmall,
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
                          AppConstant.svgWebsite,
                          colorFilter: const ColorFilter.mode(
                            AppColors.iconMuted,
                            BlendMode.srcIn,
                          ),
                          width: 16.w,
                          height: 16.h,
                        ),
                        text: org.website,
                        textStyle: AppTextStyles.captionUnderline,
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
                AppConstant.imageZakatTag,
                width: 138.w,
                height: 32.h,
                fit: BoxFit.fill,
              ),
            ),
            AppPadding.vertical24,
            Text(
              AppStrings.organizationDetails,
              style: AppTextStyles.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
