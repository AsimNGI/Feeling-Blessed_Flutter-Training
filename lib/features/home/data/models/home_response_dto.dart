/// Data transfer objects for home API response. JSON parsing lives here.
class HomeResponseDto {
  const HomeResponseDto({
    this.banner,
    this.sections = const [],
    this.onBoardingSection = const [],
  });

  final String? banner;
  final List<HomeSectionDto> sections;
  final List<HomeOnboardingItemDto> onBoardingSection;

  factory HomeResponseDto.fromJson(Map<String, dynamic> json) {
    return HomeResponseDto(
      banner: json['banner'] as String?,
      sections:
          (json['sections'] as List<dynamic>?)
              ?.map((e) => HomeSectionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      onBoardingSection:
          (json['onBoardingSection'] as List<dynamic>?)
              ?.map(
                (e) =>
                    HomeOnboardingItemDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }
}

class HomeSectionDto {
  const HomeSectionDto({
    this.title,
    this.description,
    this.type,
    this.sectionType,
    this.cellType,
    this.itemsOrg = const [],
    this.itemsDrive = const [],
  });

  final String? title;
  final String? description;
  final String? type;
  final String? sectionType;
  final String? cellType;
  final List<HomeOrgItemDto> itemsOrg;
  final List<HomeFundraiserItemDto> itemsDrive;

  factory HomeSectionDto.fromJson(Map<String, dynamic> json) {
    final itemsOrg = json['items_org'] as List<dynamic>?;
    final itemsDrive = json['items_drive'] as List<dynamic>?;
    return HomeSectionDto(
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      sectionType: json['section_type'] as String?,
      cellType: json['cell_type'] as String?,
      itemsOrg:
          itemsOrg
              ?.map((e) => HomeOrgItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      itemsDrive:
          itemsDrive
              ?.map(
                (e) =>
                    HomeFundraiserItemDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }
}

class HomeOrgItemDto {
  const HomeOrgItemDto({
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

  factory HomeOrgItemDto.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    return HomeOrgItemDto(
      id: id?.toString(),
      name: json['org_name'] as String?,
      logoUrl: json['logo_url'] as String?,
      coverUrl: json['cover_image_url'] as String?,
      slug: json['share_url'] as String?,
      cityCountry: json['city_country'] as String?,
    );
  }
}

class HomeFundraiserItemDto {
  const HomeFundraiserItemDto({
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

  factory HomeFundraiserItemDto.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    return HomeFundraiserItemDto(
      id: id?.toString(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      imageUrl: (json['cover_image_url'] ?? json['logo_url']) as String?,
      logoUrl: json['logo_url'] as String?,
      orgName: json['org_name'] as String?,
      totalPercent: json['total_percent'] as int?,
      totalAmountRaisedLabel: json['total_amount_raised_label'] as String?,
      targetAmountLabel: json['target_amount_label'] as String?,
    );
  }
}

class HomeOnboardingItemDto {
  const HomeOnboardingItemDto({this.identifier, this.visibility = false});

  final String? identifier;
  final bool visibility;

  factory HomeOnboardingItemDto.fromJson(Map<String, dynamic> json) {
    return HomeOnboardingItemDto(
      identifier: json['identifier'] as String?,
      visibility: json['visibility'] as bool? ?? false,
    );
  }
}
