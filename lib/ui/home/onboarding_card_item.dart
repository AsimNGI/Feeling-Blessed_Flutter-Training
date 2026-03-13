import 'package:flutter/material.dart';
import 'package:flutter_training/model/home/new_home_models.dart';
import 'package:flutter_training/theme/app_styles.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_padding.dart';

/// Onboarding card item – matches Android [OnboardingCardItem].
class OnboardingCardItem extends StatelessWidget {
  const OnboardingCardItem({super.key, required this.card});

  final OnboardingCard card;

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return Container(
      width: 296,
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray200, width: 1),
      ),
      padding: AppPadding.all16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(card.emoji, style: const TextStyle(fontSize: 64)),
          AppPadding.vertical8,
          Text(
            'GET STARTED',
            style: s.buttonSmall.copyWith(
              color: AppColors.gray600,
              letterSpacing: 1,
            ),
          ),
          AppPadding.vertical8,
          Text(
            card.title,
            style: s.titleSmall.copyWith(letterSpacing: 0.5),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          AppPadding.vertical8,
          Expanded(
            child: Text(
              card.description,
              style: s.bodyMedium.copyWith(
                color: AppColors.gray600,
                letterSpacing: 0.25,
                height: 1.25,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: card.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        AppColors.primaryAqua600,
                        AppColors.secondaryGreen600,
                      ],
                    ).createShader(bounds),
                    child: Text(
                      card.buttonText,
                      style: s.buttonSmall.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.primaryAqua600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
