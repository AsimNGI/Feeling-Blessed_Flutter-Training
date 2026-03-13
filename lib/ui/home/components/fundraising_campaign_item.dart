import 'package:flutter/material.dart';
import 'package:flutter_training/model/home/new_home_models.dart';
import 'package:flutter_training/theme/app_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_padding.dart';

/// Fundraiser card: cover image, title, progress bar, raised/target labels, org logo + name. Matches Android [FundraisingCampaignItem].
class FundraisingCampaignItem extends StatelessWidget {
  const FundraisingCampaignItem({
    super.key,
    required this.campaign,
    required this.totalItems,
    this.onTap,
  });

  final FundraiserInfo campaign;
  final int totalItems;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final itemWidth = screenWidth * 0.60;
    final progress = ((campaign.totalPercent ?? 0) / 100.0).clamp(0.0, 1.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: itemWidth,
        decoration: BoxDecoration(
          color: AppColors.gray50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.gray200, width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppPadding.all2,
                  child: _coverImage(campaign.imageUrl),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: AppPadding.h100),
                  child: Padding(
                    padding: AppPadding.all16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          campaign.name ?? '',
                          style: AppStyles.of(context).titleXSmall.copyWith(
                                color: AppColors.black,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: AppPadding.h8),
                        _ProgressBar(progress: progress),
                        SizedBox(height: AppPadding.h8),
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: [
                            if (campaign.totalAmountRaisedLabel != null &&
                                campaign.totalAmountRaisedLabel!.isNotEmpty)
                              Text(
                                campaign.totalAmountRaisedLabel!,
                                style: AppStyles.of(context).bodySmall.copyWith(
                                      color: AppColors.gray600,
                                    ),
                              ),
                            if (campaign.targetAmountLabel != null &&
                                campaign.targetAmountLabel!.isNotEmpty)
                              Text(
                                campaign.targetAmountLabel!,
                                style: AppStyles.of(context).bodySmall.copyWith(
                                      color: AppColors.gray600,
                                    ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (campaign.orgName != null && campaign.orgName!.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(
                  left: AppPadding.w16,
                  right: AppPadding.w16,
                  bottom: AppPadding.h16,
                ),
                child: Row(
                  children: [
                    _orgLogo(campaign.logoUrl),
                    SizedBox(width: AppPadding.w8),
                    Expanded(
                      child: Text(
                        campaign.orgName!,
                        style: AppStyles.of(context).bodySmall.copyWith(
                              color: AppColors.black,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _coverImage(String? url) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          color: AppColors.gray200,
        ),
        child: url != null && url.isNotEmpty
            ? ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (_, __, ___) => _placeholder(),
                ),
              )
            : _placeholder(),
      ),
    );
  }

  Widget _placeholder() => const Center(
        child: Icon(Icons.volunteer_activism, size: 48),
      );

  Widget _orgLogo(String? url) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.gray200),
        color: AppColors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: url != null && url.isNotEmpty
          ? Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Icon(Icons.business, size: 24, color: AppColors.gray600),
            )
          : Icon(Icons.business, size: 24, color: AppColors.gray600),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 6,
        backgroundColor: AppColors.gray200,
        valueColor: const AlwaysStoppedAnimation<Color>(
          AppColors.fundraiserProgressBackground,
        ),
      ),
    );
  }
}
