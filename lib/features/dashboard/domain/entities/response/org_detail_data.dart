import 'package:flutter/material.dart';

/// Impact category chip: emoji + label
class ImpactCategory {
  const ImpactCategory({required this.emoji, required this.label});
  final String emoji;
  final String label;
}

/// Country of impact chip: flag/icon + name
class CountryOfImpact {
  const CountryOfImpact({required this.flagOrIcon, required this.name});
  final String flagOrIcon; // emoji or asset path
  final String name;
}

/// Fundraiser card for horizontal list
class FundraiserCard {
  const FundraiserCard({
    required this.imagePath,
    required this.title,
    required this.raised,
    required this.goal,
    required this.raisedLabel,
  });
  final String imagePath;
  final String title;
  final double raised;
  final double goal;
  final String raisedLabel;
}

/// Recent donation activity item
class RecentDonation {
  const RecentDonation({
    this.avatarIcon,
    this.avatarInitials,
    required this.donorName,
    required this.message,
    required this.timeAgo,
    required this.amount,
  });
  final IconData? avatarIcon;
  final String? avatarInitials; // e.g. "AB" for Alya Abaslan
  final String donorName;
  final String message;
  final String timeAgo;
  final String amount;
}

/// Verification / trust box item: icon, bold title, and subtitle.
class VerificationItem {
  const VerificationItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;
}

/// Avatar frame style: border, background, and content (icon/initial) color.
class AvatarFrameStyle {
  const AvatarFrameStyle({
    required this.borderColor,
    required this.backgroundColor,
    required this.contentColor,
  });
  final Color borderColor;
  final Color backgroundColor;
  final Color contentColor;
}
