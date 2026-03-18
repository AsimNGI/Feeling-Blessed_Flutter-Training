import 'package:flutter_training/features/home/data/models/home_response_dto.dart';
import 'package:flutter_training/features/home/domain/entities/response/home_response.dart';

/// Maps DTOs from the data layer to domain entities.
class HomeMapper {
  HomeMapper._();

  static HomeResponse toDomain(HomeResponseDto dto) {
    return HomeResponse(
      banner: dto.banner,
      sections: dto.sections.map(HomeMapper._sectionToDomain).toList(),
      onBoardingSection:
          dto.onBoardingSection.map(HomeMapper._onboardingToDomain).toList(),
    );
  }

  static HomeSection _sectionToDomain(HomeSectionDto dto) {
    return HomeSection(
      title: dto.title,
      description: dto.description,
      type: dto.type,
      sectionType: dto.sectionType,
      cellType: dto.cellType,
      itemsOrg: dto.itemsOrg.map(HomeMapper._orgItemToDomain).toList(),
      itemsDrive:
          dto.itemsDrive.map(HomeMapper._fundraiserItemToDomain).toList(),
    );
  }

  static HomeOrgItem _orgItemToDomain(HomeOrgItemDto dto) {
    return HomeOrgItem(
      id: dto.id,
      name: dto.name,
      logoUrl: dto.logoUrl,
      coverUrl: dto.coverUrl,
      slug: dto.slug,
      cityCountry: dto.cityCountry,
    );
  }

  static HomeFundraiserItem _fundraiserItemToDomain(HomeFundraiserItemDto dto) {
    return HomeFundraiserItem(
      id: dto.id,
      name: dto.name,
      slug: dto.slug,
      imageUrl: dto.imageUrl,
      logoUrl: dto.logoUrl,
      orgName: dto.orgName,
      totalPercent: dto.totalPercent,
      totalAmountRaisedLabel: dto.totalAmountRaisedLabel,
      targetAmountLabel: dto.targetAmountLabel,
    );
  }

  static HomeOnboardingItem _onboardingToDomain(HomeOnboardingItemDto dto) {
    return HomeOnboardingItem(
      identifier: dto.identifier,
      visibility: dto.visibility,
    );
  }
}
