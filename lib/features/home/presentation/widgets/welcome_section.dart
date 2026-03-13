import 'package:flutter/material.dart';
import 'package:flutter_training/core/constants/app_colors.dart';
import 'package:flutter_training/core/constants/app_padding.dart';
import 'package:flutter_training/core/global/theme/app_styles.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/new_home_models.dart';
import 'package:flutter_training/features/home/presentation/widgets/onboarding_card_item.dart';

/// Welcome section with greeting and horizontal onboarding cards – matches Android [WelcomeSection].
class WelcomeSection extends StatelessWidget {
  const WelcomeSection({
    super.key,
    this.userName,
    this.isGuestUser = true,
    this.onBoardingSection = const [],
    this.onNavigate,
  });

  final String? userName;
  final bool isGuestUser;
  final List<OnboardingSectionItem> onBoardingSection;
  final void Function(String identifier)? onNavigate;

  static const Map<String, OnboardingCard> _cardContentMap = {
    'guest_welcome': OnboardingCard(
      emoji: '🎯',
      title: 'Create your giving profile',
      description: 'Securely save your payment methods and track all your donations in one place',
      buttonText: 'Sign up',
    ),
    'payment_method': OnboardingCard(
      emoji: '🏦',
      title: 'Add a payment method',
      description: 'A payment method is required to proceed with any donation',
      buttonText: 'Add payment method',
    ),
    'charity': OnboardingCard(
      emoji: '👐',
      title: 'Give your first donation!',
      description: 'Begin your giving journey—choose a charity or fundraiser to donate to',
      buttonText: 'Choose a charity',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    final visibleCards = <OnboardingCard>[];
    for (final item in onBoardingSection) {
      if (!item.visibility || item.identifier == null) continue;
      final card = _cardContentMap[item.identifier];
      if (card == null) continue;
      visibleCards.add(
        OnboardingCard(
          emoji: card.emoji,
          title: card.title,
          description: card.description,
          buttonText: card.buttonText,
          onTap: () => onNavigate?.call(item.identifier!),
        ),
      );
    }

    final title = isGuestUser ? 'As-salaamu alaykum' : 'As-salaamu alaykum, $userName';

    return Padding(
      padding: EdgeInsets.only(left: AppPadding.w16, right: AppPadding.w16, bottom: AppPadding.h16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppPadding.h48),
          Text(title, style: s.headlineLarge),
          if (isGuestUser) ...[
            AppPadding.vertical8,
            Text(
              'Small acts of giving, big impact -- bismillah!',
              style: s.bodyLarge.copyWith(color: AppColors.gray600),
            ),
          ],
          if (visibleCards.isNotEmpty) ...[
            AppPadding.vertical24,
            SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: visibleCards.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (_, i) => OnboardingCardItem(card: visibleCards[i]),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
