import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/core/constants/app_colors.dart';
import 'package:flutter_training/core/constants/app_font_sizes.dart';
import 'package:flutter_training/core/constants/app_images_url.dart';
import 'package:flutter_training/core/constants/app_padding.dart';
import 'package:flutter_training/core/constants/app_strings.dart';
import 'package:flutter_training/core/global/theme/app_styles.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/org_detail_data.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/organization.dart';

import '../widgets/icon_plus_text_widget.dart';

const int _kDescriptionMaxLines = 4;

/// Returns true if [text] with [style] exceeds [maxLines] when laid out in [maxWidth].
bool _textExceedsMaxLines(String text, TextStyle style, double maxWidth, int maxLines) {
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
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
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
                          IconPlusTextWidget(icon: Icons.pin_drop_outlined, text: org.location),
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
                  maxLines: hasOverflow && !_isExpanded ? _kDescriptionMaxLines : null,
                  overflow: hasOverflow && !_isExpanded ? TextOverflow.ellipsis : null,
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
                              style: s.buttonSmall.copyWith(color: Colors.white),
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
                    colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn),
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
                  icon: Icons.info_outline,
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
                Text(AppStrings.categories, style: s.titleXSmall),
                AppPadding.vertical16,
                _buildCategoriesWrap(context, s),
                AppPadding.vertical24,
                Text(AppStrings.countryOfImpact, style: s.titleXSmall),
                AppPadding.vertical16,
                _buildCountriesWrap(context, s),
                AppPadding.vertical32,
                Text(AppStrings.fundraisingNow, style: s.titleMedium),
                AppPadding.vertical16,
                _buildFundraiserCardList(context, s),
                AppPadding.vertical32,
                Divider(color: AppColors.border),
                AppPadding.vertical32,
                Text(AppStrings.recentActivity, style: s.titleMedium),
                AppPadding.vertical16,
                _buildRecentActivitySummary(context, s),
                AppPadding.vertical16,
                _buildRecentDonationsList(context, s),
                AppPadding.vertical32,
                _buildVerificationSection(context, s),
                AppPadding.vertical32,
                _buildDonateButton(context, s),
                AppPadding.vertical60,
              ],
            );
          },
        ),
      ),
    );
  }

  List<ImpactCategory> get _categories => const [
    ImpactCategory(emoji: '👶', label: AppStrings.categoryOrphans),
    ImpactCategory(emoji: '💧', label: AppStrings.categoryFoodRelief),
    ImpactCategory(emoji: '📚', label: AppStrings.categoryEducation),
    ImpactCategory(emoji: '🏥', label: AppStrings.categoryHealth),
  ];

  List<CountryOfImpact> get _countries => const [
    CountryOfImpact(flagOrIcon: '🇵🇰', name: AppStrings.countryPakistan),
    CountryOfImpact(flagOrIcon: '🇵🇸', name: AppStrings.countryPalestine),
    CountryOfImpact(flagOrIcon: '🇸🇾', name: AppStrings.countrySyria),
    CountryOfImpact(flagOrIcon: '🇧🇩', name: AppStrings.countryBangladesh),
  ];

  List<FundraiserCard> get _fundraisers => [
    FundraiserCard(
      imagePath: AppImagesUrl.coverImagePlaceholder,
      title: AppStrings.fundraiserLebanon,
      raised: 7000,
      goal: 10000,
      raisedLabel: r'$3,000 raised',
    ),
    FundraiserCard(
      imagePath: AppImagesUrl.coverImagePlaceholder,
      title: AppStrings.fundraiserLorem,
      raised: 1200,
      goal: 5000,
      raisedLabel: r'$100 raised',
    ),
  ];

  List<VerificationItem> get _verificationItems => [
    VerificationItem(
      icon: Icons.verified_user_outlined,
      title: AppStrings.verifiedByFeelingBlessedTitle,
      subtitle: AppStrings.verifiedByFeelingBlessedSubtitle,
    ),
    VerificationItem(
      icon: Icons.account_balance_wallet_outlined,
      title: AppStrings.directDonationToCharityTitle,
      subtitle: AppStrings.directDonationToCharitySubtitle,
    ),
    VerificationItem(
      icon: Icons.business_outlined,
      title: AppStrings.registeredWithIRSTitle,
      subtitle: AppStrings.registeredWithIRSSubtitle,
    ),
  ];

  Widget _buildCategoriesWrap(BuildContext context, AppStyles s) {
    return Wrap(
      spacing: AppPadding.w8,
      runSpacing: AppPadding.h8,
      children: _categories
          .map(
            (c) => Material(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppPadding.r8),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(AppPadding.r8),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.w16,
                    vertical: AppPadding.h8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(AppPadding.r8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(c.emoji, style: TextStyle(fontSize: 20.sp)),
                      AppPadding.horizontal8,
                      Text(c.label, style: s.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCountriesWrap(BuildContext context, AppStyles s) {
    return Wrap(
      spacing: AppPadding.w8,
      runSpacing: AppPadding.h8,
      children: _countries
          .map(
            (c) => Material(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppPadding.r8),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(AppPadding.r8),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.w16,
                    vertical: AppPadding.h8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(AppPadding.r8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(c.flagOrIcon, style: TextStyle(fontSize: AppFontSizes.sp20)),
                      SizedBox(width: AppPadding.w6),
                      Text(c.name, style: s.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildFundraiserCardList(BuildContext context, AppStyles s) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = screenWidth * 0.6;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < _fundraisers.length; i++) ...[
              if (i > 0) SizedBox(width: AppPadding.w12),
              _buildFundraiserCard(context, _fundraisers[i], s, cardWidth),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFundraiserCard(
    BuildContext context,
    FundraiserCard card,
    AppStyles s,
    double cardWidth,
  ) {
    final progress = card.goal > 0 ? card.raised / card.goal : 0.0;
    return SizedBox(
      width: cardWidth,
      child: Card(
        color: AppColors.fundraiserCardBackground,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppPadding.r16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPadding.all2,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset(card.imagePath, fit: BoxFit.cover),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: AppPadding.h100),
              child: Padding(
                padding: AppPadding.all16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      card.title,
                      style: s.titleXSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppPadding.vertical8,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppPadding.r4),
                          child: LinearProgressIndicator(
                            value: progress.clamp(0.0, 1.0),
                            minHeight: AppPadding.h6,
                            backgroundColor: AppColors.border,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.fundraiserProgressBackground,
                            ),
                          ),
                        ),
                        AppPadding.vertical8,
                        Text(
                          "${card.raisedLabel} of ${card.goal.toString()}",
                          style: s.bodySmall.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivitySummary(BuildContext context, AppStyles s) {
    return Container(
      padding: AppPadding.only(
        top: AppPadding.h24,
        bottom: AppPadding.h24,
        left: AppPadding.w16,
        right: AppPadding.w16,
      ),
      decoration: BoxDecoration(
        color: AppColors.purple50,
        borderRadius: BorderRadius.circular(AppPadding.r16),
        border: Border.all(color: AppColors.purple100),
      ),
      child: Row(
        children: [
          Container(
            padding: AppPadding.all8,
            decoration: BoxDecoration(
              color: AppColors.purple100,
              borderRadius: BorderRadius.circular(AppPadding.r50),
            ),
            child: Icon(Icons.bar_chart, size: AppPadding.r24, color: AppColors.infoMain),
          ),
          SizedBox(width: AppPadding.w12),
          Expanded(child: Text(AppStrings.peopleDonatedSummary, style: s.bodyMedium)),
        ],
      ),
    );
  }

  /// Frame styles for donation avatars: border, background, content (heart/initial).
  /// Each item uses a different style by index.
  static const List<AvatarFrameStyle> _avatarFrameStyles = [
    AvatarFrameStyle(
      borderColor: AppColors.purple100,
      backgroundColor: AppColors.purple50,
      contentColor: AppColors.purple500,
    ),
    AvatarFrameStyle(
      borderColor: AppColors.primaryAqua200,
      backgroundColor: AppColors.primaryAqua50,
      contentColor: AppColors.primaryAqua600,
    ),
    AvatarFrameStyle(
      borderColor: AppColors.secondaryGreen200,
      backgroundColor: AppColors.secondaryGreen50,
      contentColor: AppColors.secondaryGreen600,
    ),
    AvatarFrameStyle(
      borderColor: AppColors.yellow200,
      backgroundColor: AppColors.yellow50,
      contentColor: AppColors.yellow600,
    ),
    AvatarFrameStyle(
      borderColor: AppColors.red200,
      backgroundColor: AppColors.red50,
      contentColor: AppColors.red600,
    ),
    AvatarFrameStyle(
      borderColor: AppColors.blue250,
      backgroundColor: AppColors.blue50,
      contentColor: AppColors.blue550,
    ),
  ];

  List<RecentDonation> _getRecentDonations() {
    return [
      RecentDonation(
        avatarIcon: Icons.favorite,
        donorName: AppStrings.silentGiver,
        message: AppStrings.messageBless,
        timeAgo: AppStrings.today,
        amount: r'$5',
      ),
      RecentDonation(
        avatarIcon: Icons.favorite,
        donorName: AppStrings.kindDonor,
        message: AppStrings.messageHonor,
        timeAgo: AppStrings.oneDayAgo,
        amount: r'$10',
      ),
      RecentDonation(
        avatarInitials: 'AA',
        donorName: AppStrings.donorAlya,
        message: AppStrings.messageBless,
        timeAgo: AppStrings.sixDaysAgo,
        amount: r'$40',
      ),
    ];
  }

  Widget _buildRecentDonationsList(BuildContext context, AppStyles s) {
    final donations = _getRecentDonations();
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: donations.length,
      separatorBuilder: (_, __) => AppPadding.vertical12,
      itemBuilder: (context, index) {
        final d = donations[index];
        final frameStyle = _avatarFrameStyles[index % _avatarFrameStyles.length];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppPadding.r40,
              height: AppPadding.r40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: frameStyle.backgroundColor,
                border: Border.all(color: frameStyle.borderColor, width: 1),
              ),
              child: Center(
                child: d.avatarIcon != null
                    ? Icon(d.avatarIcon, size: AppPadding.r20, color: frameStyle.contentColor)
                    : Text(
                        d.avatarInitials ?? '',
                        style: s.bodyLarge.copyWith(
                          color: frameStyle.contentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
            SizedBox(width: AppPadding.w12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(d.donorName, style: s.titleXSmall),
                  AppPadding.vertical4,
                  Text(d.message, style: s.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                  AppPadding.vertical4,
                  Text(d.timeAgo, style: s.caption),
                ],
              ),
            ),
            Text(d.amount, style: s.titleSmall),
          ],
        );
      },
    );
  }

  Widget _buildVerificationSection(BuildContext context, AppStyles s) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(AppPadding.w20, AppPadding.h20, AppPadding.w20, AppPadding.h24),
      decoration: BoxDecoration(
        color: AppColors.fundraiserCardBackground,
        borderRadius: BorderRadius.all(Radius.circular(AppPadding.r16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < _verificationItems.length; i++) ...[
            if (i > 0) SizedBox(height: AppPadding.h20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _verificationItems[i].icon,
                  size: AppPadding.r32,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: AppPadding.w16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _verificationItems[i].title,
                        style: s.titleSmall.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: AppPadding.h4),
                      Text(
                        _verificationItems[i].subtitle,
                        style: s.bodySmall.copyWith(color: AppColors.textSecondary, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDonateButton(BuildContext context, AppStyles s) {
    return SizedBox(
      width: double.infinity,
      height: AppPadding.h50,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(AppPadding.r12),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: AppPadding.h16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPadding.r16),
              gradient: RadialGradient(
                center: Alignment(-0.0395, 1.0),
                radius: 1.5,
                colors: const [
                  AppColors.donateGradientStart,
                  AppColors.donateGradientMid,
                  AppColors.donateGradientEnd,
                ],
                stops: const [0.0, 0.5283, 1.0],
              ),
            ),
            child: Center(
              child: Text(AppStrings.donate, style: s.bodyMedium.copyWith(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
