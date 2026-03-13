import 'package:flutter/material.dart';
import 'package:flutter_training/model/home/new_home_models.dart';
import 'package:flutter_training/ui/home/components/fundraising_campaign_item.dart';
import 'package:flutter_training/ui/home/components/nearby_charity_item.dart';
import 'package:flutter_training/ui/home/components/suggested_charity_item.dart';
import 'package:flutter_training/ui/home/section_header.dart';
import 'package:flutter_training/utils/app_padding.dart';

/// Generic section: title + horizontal list of org/fundraiser items – matches Android [GenericSection].
/// Uses three card types: [SuggestedCharityItem] (LARGE org), [NearbyCharityItem] (SMALL org), [FundraisingCampaignItem].
class GenericSection extends StatelessWidget {
  const GenericSection({
    super.key,
    required this.section,
    this.onOrgTap,
    this.onFundraiserTap,
    this.onSeeAllTap,
  });

  final NewHomeSection section;
  final void Function(OrgInfo org)? onOrgTap;
  final void Function(FundraiserInfo fundraiser)? onFundraiserTap;
  final VoidCallback? onSeeAllTap;

  static bool _isLargeCell(String? cellType) {
    if (cellType == null) return false;
    return cellType.toLowerCase() == 'large';
  }

  @override
  Widget build(BuildContext context) {
    final hasOrgs = section.itemsOrg.isNotEmpty;
    final hasDrive = section.itemsDrive.isNotEmpty;
    final itemCount =
        hasOrgs ? section.itemsOrg.length : (hasDrive ? section.itemsDrive.length : 0);
    final title = section.title ?? 'Section';
    final description = section.description ?? '';

    if (itemCount == 0) return const SizedBox.shrink();

    final isLargeOrg = hasOrgs && _isLargeCell(section.cellType);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppPadding.h48),
        SectionHeader(
          title: title,
          description: description,
          showArrow: itemCount > 0,
          onArrowTap: onSeeAllTap,
        ),
        AppPadding.vertical16,
        IntrinsicHeight(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: AppPadding.screenHorizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < itemCount; i++) ...[
                  if (i > 0) SizedBox(width: AppPadding.w16),
                  if (hasOrgs)
                    isLargeOrg
                        ? SuggestedCharityItem(
                            charity: section.itemsOrg[i],
                            totalItems: itemCount,
                            onTap: () => onOrgTap?.call(section.itemsOrg[i]),
                          )
                        : NearbyCharityItem(
                            charity: section.itemsOrg[i],
                            totalItems: itemCount,
                            onTap: () => onOrgTap?.call(section.itemsOrg[i]),
                          )
                  else
                    FundraisingCampaignItem(
                      campaign: section.itemsDrive[i],
                      totalItems: itemCount,
                      onTap: () =>
                          onFundraiserTap?.call(section.itemsDrive[i]),
                    ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
