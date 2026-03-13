import 'package:flutter/foundation.dart';

/// Home API result – matches Android [NewHomeResult].
class NewHomeResult {
  const NewHomeResult({
    this.banner,
    this.sections = const [],
    this.onBoardingSection = const [],
  });

  final String? banner;
  final List<NewHomeSection> sections;
  final List<OnboardingSectionItem> onBoardingSection;

  NewHomeResult copyWith({
    String? banner,
    List<NewHomeSection>? sections,
    List<OnboardingSectionItem>? onBoardingSection,
  }) {
    return NewHomeResult(
      banner: banner ?? this.banner,
      sections: sections ?? this.sections,
      onBoardingSection: onBoardingSection ?? this.onBoardingSection,
    );
  }
}

/// Single section on the home screen – matches Android [NewHomeSection].
class NewHomeSection {
  const NewHomeSection({
    this.description,
    this.itemsOrg = const [],
    this.itemsDrive = const [],
    this.position,
    this.title,
    this.type,
    this.sectionType,
    this.cellType,
  });

  final String? description;
  final List<OrgInfo> itemsOrg;
  final List<FundraiserInfo> itemsDrive;
  final int? position;
  final String? title;
  final String? type;
  final String? sectionType;
  final String? cellType;
}

/// Onboarding section visibility from API – matches Android [OnboardingSectionItem].
class OnboardingSectionItem {
  const OnboardingSectionItem({
    this.identifier,
    this.visibility = false,
  });

  final String? identifier;
  final bool visibility;
}

/// Minimal org model for home section items (Android: org.Info).
class OrgInfo {
  const OrgInfo({
    this.id,
    this.name,
    this.logoUrl,
    this.coverUrl,
    this.slug,
    this.cityCountry,
  });

  final String? id;
  final String? name;
  final String? logoUrl;
  final String? coverUrl;
  final String? slug;
  final String? cityCountry;
}

/// Minimal fundraiser model for home section items (Android: fundraiser.Info).
class FundraiserInfo {
  const FundraiserInfo({
    this.id,
    this.name,
    this.slug,
    this.imageUrl,
    this.logoUrl,
    this.orgName,
    this.totalPercent,
    this.totalAmountRaisedLabel,
    this.targetAmountLabel,
  });

  final String? id;
  final String? name;
  final String? slug;
  final String? imageUrl;
  final String? logoUrl;
  final String? orgName;
  final int? totalPercent;
  final String? totalAmountRaisedLabel;
  final String? targetAmountLabel;
}

/// Local onboarding card content (emoji, title, description, button, action).
class OnboardingCard {
  const OnboardingCard({
    required this.emoji,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onTap,
  });

  final String emoji;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onTap;
}
